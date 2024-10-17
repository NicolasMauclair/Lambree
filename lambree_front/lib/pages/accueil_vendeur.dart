import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccueil extends StatefulWidget {
  const MyAccueil({super.key});

  @override
  State<MyAccueil> createState() => MyAccueilState();
}

class MyAccueilState extends State<MyAccueil> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Accueil vendeur'), // Utilisation de `child:` ici
      ),
    );
  }
}
