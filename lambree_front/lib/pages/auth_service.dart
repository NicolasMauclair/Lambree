import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../methods/API.dart';
import '../methods/user_service.dart';

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

     //String csrfToken = await fetchCsrfToken();

    // On appelle l'API et on obtient une réponse HTTP brute
    final response = await API().postRequest(route: '/flutter', data: data);

    // Vérification que la requête a réussi (statut 200)
    if (response.statusCode == 200) {
      // On décode la réponse JSON
      final result = jsonDecode(response.body); // Important: décoder la réponse JSON

      // Stocker le rôle dans SharedPreferences
      UserService().saveUserRole(result['role']);

      // Vérification que le statut est bien 200 dans le JSON
      if (result["status"] == 200) {
        // Utiliser le bon rôle récupéré depuis la réponse
        navigateBasedOnRole(result['role'], context);
      } else {
        // Gérer une réponse inattendue (ex: mauvais identifiants)
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
