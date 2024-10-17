import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'API.dart';
import 'user_service.dart';

// Classe qui gère l'uthentification d'un utilisateur
class AuthService {

  // Méthode qui gère la navigation en fonction du rôle
  void navigateBasedOnRole(String role, BuildContext context) {
    if (role == 'admin') {
      Navigator.pushReplacementNamed(context, '/second');
    } else if (role == 'user') {
      Navigator.pushReplacementNamed(context, '/');
    } else {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  // Méthode qui récupère le token avec une requête GET
  Future<String> fetchCsrfToken() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/csrf-token'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['csrf_token'];
    } else {
      throw Exception('Failed to load CSRF token');
    }
  }

  // Méthode qui récupère les informations de connexion, les envoie à l'API et gère la redirection
  Future<void> connexion(
      String mail, String password, BuildContext context) async {
    final data = {
      'email': mail,
      'password': password,
    };

     // Récupération du token
     //String csrfToken = await fetchCsrfToken();

    // Appl à l'API
    final response = await API().postRequest(route: '/flutter', data: data);

    if (response.statusCode == 200) {

      final result = jsonDecode(response.body);

      // Stocker le rôle dans SharedPreferences
      UserService().saveUserRole(result['role']);

      // Vérification que le statut est bien 200 dans le JSON
      if (result["status"] == 200) {
        navigateBasedOnRole(result['role'], context);

      } else {
        // Gérer une réponse inattendue
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Erreur lors de l'authentification"),
          ),
        );
      }
    } else {
      // Gérer les erreurs de statut HTTP (ex : 401 Unauthorized)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erreur HTTP : ${response.statusCode}"),
        ),
      );
    }
  }
}
