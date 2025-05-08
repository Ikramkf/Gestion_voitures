import 'package:flutter/material.dart';
import 'car.dart';
import 'cars_list.dart';
import 'custom_drawer.dart';
import 'like.dart';

class CarsGridPage extends StatelessWidget {
  const CarsGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grille des voitures'), backgroundColor: 	Color(0xFFE0B0FF)),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: cars.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final car = cars[index];
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('${car.brand} ${car.model}'),
                    content: car.image,
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 6,
                color: Colors.white,
                shadowColor: Colors.grey.shade300,
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                        child: car.image,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(car.model,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: 	Color(0xFFE0B0FF)),
                              textAlign: TextAlign.center),
                          const SizedBox(height: 4),
                          Text(car.brand, style: const TextStyle(color: Colors.black54)),
                          const HeartButton(), // bouton like
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
