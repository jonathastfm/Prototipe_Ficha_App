import 'package:ficha_app_01/classes/Personagen.dart';
import 'package:flutter/material.dart';

class FichaPage extends StatelessWidget {
  final Personagem personagem;

  const FichaPage({required this.personagem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ficha do Personagem'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(personagem.nome, style: TextStyle(fontSize: 24)),
              Divider(),
              CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50)
              ),
              Divider(),
              GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                shrinkWrap: true,
                itemCount: personagem.atributos.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 30,
                    width: 30,
                    child: Card(
                      child: Column(
                        children: [
                          Text(personagem.atributos.keys.elementAt(index), style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(personagem.atributos.values.elementAt(index).toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
