import 'package:flutter/material.dart';
import 'loginpage.dart'; // Assurez-vous d'importer votre LoginPage ici


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Utilisez la page de connexion comme page d'accueil
    );
  }
}
