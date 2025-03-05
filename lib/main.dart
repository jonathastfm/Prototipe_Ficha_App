
import 'package:flutter/material.dart';

import 'classes/DndClass.dart';
import 'classes/Personagem.dart';
import 'pages/ficha_page.dart';

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
      
      atributos: {
        "For": 10,
        "Dex": 14,
        "Con": 15,
        "Int": 18,
        "Sab": 9,
        "Car": 10
      },
      proficiencias: {
        "Acrobacia": false,
        "Adestrar Animais": false,
        "Arcanismo": false,
        "Atletismo": false,
        "Enganação": false,
        "História": false,
        "Intuição": false,
        "Intimidação": false,
        "Medicina": false,
        "Natureza": false,
        "Percepção": false,
        "Atuação": false,
        "Persuasão": false,
        "Religião": false,
        "Furtividade": true,
        "Prestidigitação": false,
        "Sobrevivência": false
      },
      salvaguardas: {
        "For": false,
        "Dex": false,
        "Con": true,
        "Int": true,
        "Sab": false,
        "Car": false
      }
    );

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FichaPage(personagem: altair),
    );
  }
}