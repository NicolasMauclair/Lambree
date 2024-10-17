import 'package:http/http.dart' as http;
import 'dart:convert';

// Classe qui gère les appels à l'PI et renvoir la réponse
class API {
  Future<http.Response> postRequest({
    required String route, 
    required Map<String, String> data,
    //required String csrfToken,
  }) async {
    String url = "http://10.0.2.2:8000$route";
    
    // Envoie de la requête HTTP POST
    return await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: _header(),
      //headers: _header(csrfToken),
    );
  }

  // Headers par défaut pour les requêtes
  Map<String, String> _header() => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    //'X-CSRF-TOKEN': csrfToken,
  };
}
