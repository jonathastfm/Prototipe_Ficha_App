import 'package:ficha_app_01/classes/DndClass.dart';
import 'package:ficha_app_01/classes/Personagen.dart';
import 'package:ficha_app_01/pages/Ficha_Page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  Personagem altair = Personagem(
    nome: 'Altair',
    idade: 25,
    raca: 'Humano',
    classe: DnDClass(
      name: "Artificer", 
      description: "Techmage", 
      hpDice: 8, 
      proficiencies: ["int", "const"], 
      abilities: ["conjuração", "engenharia magica"]),
      atributos: {
        'Força': 10,
        'Destreza': 16,
        'Constituição': 14,
        'Inteligência': 18,
        'Sabedoria': 12,
        'Carisma': 10,
      },
    proficiencias: ['Lâminas Ocultas', 'Furtividade', 'Parkour'],
  );

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RPG App Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the RPG App!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to character creation page
              },
              child: Text('Create Character'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to character list page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ficha_Page(   personagem: altair)),
                );
              },
              child: Text('View Characters'),
            ),
          ],
        ),
      ),
    );
  }
}