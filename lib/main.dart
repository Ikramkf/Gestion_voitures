import 'package:flutter/material.dart';
import 'login_page.dart';
import 'cars_list_page.dart';
import 'cars_grid.dart';
import 'formulaire.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion Voitures',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: 	Color(0xFFE0B0FF)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/grid': (context) => const CarsGridPage(),
        '/liste': (context) => const CarsListPage(),
        '/formulaire': (context) => Formulaire(),
      },
    );
  }
}
