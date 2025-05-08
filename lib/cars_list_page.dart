import 'package:flutter/material.dart';
import 'cars_list.dart';
import 'custom_drawer.dart';

class CarsListPage extends StatefulWidget {
  const CarsListPage({super.key});

  @override
  State<CarsListPage> createState() => _CarsListPageState();
}

class _CarsListPageState extends State<CarsListPage> {
  final _cars = cars;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Luxury cars gallery (ListView)'), backgroundColor: Color(0xFFE0B0FF)),
      drawer: const CustomDrawer(),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(color: Color(0xFFE0B0FF)),
        itemCount: _cars.length,
        itemBuilder: (context, index) {
          final item = _cars[index];
          return Dismissible(
            key: Key(item.brand),
            background: Container(
              color: Color(0xFFC9A0DC),
              child: const Icon(Icons.delete, size: 40, color: Colors.white),
            ),
            onDismissed: (_) {
              setState(() {
                _cars.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item.brand} supprimée')),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(item.model,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC9A0DC), fontSize: 20)),
                subtitle: Text(item.brand, textAlign: TextAlign.center),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text("${item.brand} ${item.model}", style: const TextStyle(color: Color(0xFFC9A0DC))),
                        content: item.image,
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
