import 'package:ficha_app_01/classes/DndClass.dart';
import 'package:ficha_app_01/classes/Personagem.dart';
import 'package:ficha_app_01/pages/Ficha_Page.dart';
import 'package:flutter/material.dart';

class HomeFichaWidget extends StatefulWidget {
  HomeFichaWidget({super.key});

  final List<Personagem> personagens = []; // Initialize with your list of Personagem objects

  @override
  State<HomeFichaWidget> createState() => _HomeFichaWidgetState();
}

class _HomeFichaWidgetState extends State<HomeFichaWidget> {

  List<Personagem> personagens = [
    Personagem(
      nome: 'Aragorn',
      idade: 87,
      raca: 'Humano',
      classe: DnDClass(
      nome: 'Ranger',
      descricao: 'Guardião das florestas',
      hpDice: 10,
      proficiencias: ['Espadas', 'Arcos'],
      habilidades: ['Rastreamento', 'Sobrevivência'],
      ),
      proficiencias: {
      "Acrobacia": true,
      "Adestrar Animais": true,
      "Arcanismo": false,
      "Atletismo": true,
      "Enganação": false,
      "História": false,
      "Intuição": true,
      "Intimidação": false,
      "Medicina": false,
      "Natureza": true,
      "Percepção": true,
      "Atuação": false,
      "Persuasão": false,
      "Religião": false,
      "Furtividade": true,
      "Prestidigitação": false,
      "Sobrevivência": true,
      },
      atributos: {
      "For": 15,
      "Dex": 14,
      "Con": 13,
      "Int": 12,
      "Sab": 10,
      "Car": 8,
      },
      salvaguardas: {
      "For": true,
      "Dex": true,
      "Con": false,
      "Int": false,
      "Sab": false,
      "Car": false,
      },
    ),
    Personagem(
      nome: 'Gandalf',
      idade: 2019,
      raca: 'Maia',
      classe: DnDClass(
      nome: 'Mago',
      descricao: 'Mestre das artes arcanas',
      hpDice: 6,
      proficiencias: ['Varinhas', 'Bastões'],
      habilidades: ['Lançar feitiços', 'Conhecimento arcano'],
      ),
      proficiencias: {
      "Acrobacia": false,
      "Adestrar Animais": false,
      "Arcanismo": true,
      "Atletismo": false,
      "Enganação": false,
      "História": true,
      "Intuição": true,
      "Intimidação": false,
      "Medicina": true,
      "Natureza": true,
      "Percepção": true,
      "Atuação": false,
      "Persuasão": true,
      "Religião": true,
      "Furtividade": false,
      "Prestidigitação": true,
      "Sobrevivência": false,
      },
      atributos: {
      "For": 8,
      "Dex": 10,
      "Con": 12,
      "Int": 18,
      "Sab": 16,
      "Car": 14,
      },
      salvaguardas: {
      "For": false,
      "Dex": false,
      "Con": true,
      "Int": true,
      "Sab": true,
      "Car": false,
      },
    ),
    Personagem(
      nome: 'Legolas',
      idade: 2931,
      raca: 'Elfo',
      classe: DnDClass(
      nome: 'Arqueiro',
      descricao: 'Mestre do arco e flecha',
      hpDice: 8,
      proficiencias: ['Arcos', 'Espadas curtas'],
      habilidades: ['Tiro certeiro', 'Visão aguçada'],
      ),
      proficiencias: {
      "Acrobacia": true,
      "Adestrar Animais": false,
      "Arcanismo": false,
      "Atletismo": true,
      "Enganação": false,
      "História": false,
      "Intuição": true,
      "Intimidação": false,
      "Medicina": false,
      "Natureza": true,
      "Percepção": true,
      "Atuação": false,
      "Persuasão": false,
      "Religião": false,
      "Furtividade": true,
      "Prestidigitação": false,
      "Sobrevivência": true,
      },
      atributos: {
      "For": 13,
      "Dex": 18,
      "Con": 12,
      "Int": 10,
      "Sab": 14,
      "Car": 10,
      },
      salvaguardas: {
      "For": false,
      "Dex": true,
      "Con": false,
      "Int": false,
      "Sab": true,
      "Car": false,
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: personagens.length + 1,
        itemBuilder: (context, index) {
          if (index == personagens.length) {
        return ElevatedButton(
          onPressed: () {
            // Handle create new character
          },
          child: Text('Criar Nova Ficha'),
        );
          }
          final personagem = personagens[index];
          return buildCharacterTile(context, personagem);
        },
      ),
    );
  }
}

Widget buildCharacterTile(BuildContext context, Personagem personagem) {
  return Card(
    color: Colors.grey[200],
    child: ListTile(
      title: Text(personagem.nome),
      subtitle: Text('${personagem.classe.nome} ${personagem.nivel}'),
      leading: CircleAvatar(
        child: Text(personagem.nome[0]),
      ),
      onTap: () {
        // Navigate to the character details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FichaPage(personagem: personagem),
          ),
        );
      },
    ),
  );
}