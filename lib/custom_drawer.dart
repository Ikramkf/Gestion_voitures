import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Luxury Cars"),
            accountEmail: Text("contact@luxurycars.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.directions_car, size: 40, color: Color(0xFFE0B0FF)),
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFC9A0DC), Color(0xFFBA55D3)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.grid_view, color: Color(0xFFE0B0FF)),
            title: Text("Grille des voitures"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/grid');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list, color: Color(0xFFE0B0FF)),
            title: Text("Liste des voitures"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/liste');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person, color: Color(0xFFE0B0FF)),
            title: Text("Formulaire"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/formulaire');
            },
          ),
        ],
      ),
    );
  }
}
