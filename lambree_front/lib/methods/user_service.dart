import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  // Méthode pour stocker le rôle de l'utilisateur
  Future<void> saveUserRole(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_role', role);
  }

  // Méthode pour récupérer le rôle de l'utilisateur
  Future<String?> getUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_role'); // Retourne le rôle ou null s'il n'existe pas
  }

  // Méthode pour vérifier le rôle de l'utilisateur
  Future<bool> isUserAdmin() async {
    String? role = await getUserRole();
    return role == 'admin';
  }
}
