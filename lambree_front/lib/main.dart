import 'package:flutter/material.dart';

import 'pages/accueil_vendeur.dart';
import 'pages/connexionForm.dart';

void main() {
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Route initiale
      routes: {
        '/': (context) => const MyConnexionForm(), // Écran d'accueil
        '/second': (context) => const MyAccueil(), // Deuxième écran
      },  
    );
  }
}
