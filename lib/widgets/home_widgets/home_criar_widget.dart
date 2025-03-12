import 'package:flutter/material.dart';

class HomeCriarWidget extends StatelessWidget {
  const HomeCriarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.5,
        ),
        
        children: [
          buildButton('Guerreiro', 'Guerreiro', 1),
          buildButton('Mago', 'Mago', 1),
          buildButton('Ladino', 'Ladino', 1),
          
        ],
          
      
      ),
    );
  }
}

Widget buildButton(String nome, String classe, int nivel) {
  return Card(
    color: Colors.grey[200],
    child: MaterialButton(
      
      onPressed: (){}, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, size: 50),
          Text('$classe $nivel'),
        ],
      ),
    )
  );
}