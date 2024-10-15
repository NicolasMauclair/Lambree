import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>(); // Clé globale pour le formulaire

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFEEE8E8),

      body: Center(
        child: IntrinsicHeight(
          child: IntrinsicWidth(
            child: 

            // Conteneur du formulaire
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFFDF7F7),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: const Offset(4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: 
              
              Form(
                key: _formKey,
                child: 
                
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    // --- Texte du formulaire

                    const Center(
                      child: 
                      Text(
                        "Bonjour",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'inter'),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Connectez-vous à votre compte",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'inter'),
                    ),

                    const SizedBox(height: 60),

                    // --- Champ de saisie : Email

                    SizedBox(
                      width: 300,
                      child: 
                      
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              offset: const Offset(0, 2), // Ombre en bas
                              blurRadius: 8.0, // Flou de l'ombre
                              spreadRadius: 1.0, // Expansion de l'ombre
                            ),
                          ],
                        ),
                        child: 
                        
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:15.0),
                              child: Image.asset(
                                'lib/images/utilisateur.png',
                                width: 24,
                                height: 24,
                              ),
                            ),

                            const SizedBox(width: 8),

                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  border: InputBorder.none, // Supprime le contour par défaut
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer du texte';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // --- Champ de saisie : Mot de passe

                    SizedBox(
                      width: 300,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              offset: const Offset(0, 2), // Ombre en bas
                              blurRadius: 8.0, // Flou de l'ombre
                              spreadRadius: 1.0, // Expansion de l'ombre
                            ),
                          ],
                        ),
                        child: 
                        
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Image.asset(
                                'lib/images/bloquer.png',
                                width: 24,
                                height: 24,
                              ),
                            ),

                            const SizedBox(width: 8),

                            Expanded(
                              child: 
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Mot de passe',
                                  border: InputBorder.none,
                                ),
                                obscureText: true, // Masque le texte saisi
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer du texte';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // --- Bouton de soumission

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: 
                      Center(
                        child: 

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: const Size(40, 40),
                          ),

                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Traitement des données'),
                                ),
                              );
                            }
                          },

                          child: const Icon(
                            Icons.arrow_forward,
                            size: 24,
                            color: Colors.white,
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
