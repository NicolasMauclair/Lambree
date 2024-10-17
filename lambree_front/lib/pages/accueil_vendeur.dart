import 'package:flutter/material.dart';

class MyAccueil extends StatefulWidget {
  const MyAccueil({super.key});

  @override
  State<MyAccueil> createState() => MyAccueilState();
}

class MyAccueilState extends State<MyAccueil> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              SizedBox(height: 50),
              
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 20.0),
                child: Text(
                  "Mes livraisons",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'inter'),
                ),
              ),
        
              Center(
                child: ColoredBox(
                  color: Colors.white,
                  child: SizedBox(
                    height: 2,
                    width: 300,
                  ),
                ),
              ),
        
            ],
          ),
      );
  }
}
