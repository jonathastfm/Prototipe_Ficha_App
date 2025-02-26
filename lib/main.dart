import 'package:ficha_app_01/classes/DndClass.dart';
import 'package:ficha_app_01/classes/Personagen.dart';
import 'package:ficha_app_01/pages/Ficha_Page.dart';
import 'package:ficha_app_01/pages/Home_Page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FichaApp());
}

class FichaApp extends StatelessWidget {
  const FichaApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    Personagem altair = Personagem(
      nome: "Altair", 
      idade: 80, 
      raca: "humano", 
      classe: DnDClass(
        name: "Artificer", 
        description: "TechMage", 
        hpDice: 8, 
        proficiencies: ["arcanismo", "prestigitação"], 
        abilities: ["Conjuração"]
      ), 
      proficiencias: [""], 
      atributos: {
        "For": 10,
        "Dex": 14,
        "Con": 15,
        "Int": 18,
        "Sab": 9,
        "Car": 10
      }
    );

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Ficha_Page(personagem: altair),
    );
  }
}