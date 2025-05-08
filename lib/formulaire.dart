import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Formulaire extends StatefulWidget {
  @override
  _FormulaireState createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  final _formKey = GlobalKey<FormState>();
  String nom = '';
  String prenom = '';
  DateTime? dateNaissance;
  String sexe = '';
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != dateNaissance) {
      setState(() {
        dateNaissance = picked;
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && sexe.isNotEmpty && dateNaissance != null) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Formulaire envoyé avec succès")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Veuillez remplir tous les champs")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulaire")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null,
                  child: _selectedImage == null ? Icon(Icons.add_a_photo, size: 40) : null,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) => value!.isEmpty ? 'Veuillez entrer un nom' : null,
                onSaved: (value) => nom = value!,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Prénom'),
                validator: (value) => value!.isEmpty ? 'Veuillez entrer un prénom' : null,
                onSaved: (value) => prenom = value!,
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text(dateNaissance == null
                    ? 'Choisir une date de naissance'
                    : 'Date: ${dateNaissance!.day}/${dateNaissance!.month}/${dateNaissance!.year}'),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text('Homme', style: TextStyle(fontSize: 16)),
                      value: 'Homme',
                      groupValue: sexe,
                      onChanged: (value) {
                        setState(() {
                          sexe = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text('Femme', style: TextStyle(fontSize: 16)),
                      value: 'Femme',
                      groupValue: sexe,
                      onChanged: (value) {
                        setState(() {
                          sexe = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Soumettre'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
