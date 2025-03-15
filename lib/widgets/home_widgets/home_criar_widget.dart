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
          buildButton('Criar Classe'),
          buildButton('Criar SubClasse'),
          buildButton('Criar Raça'),
          
        ],
          
      
      ),
    );
  }
}

Widget buildButton(String nome) {
  return Card(
    color: Colors.grey[200],
    child: MaterialButton(
      
      onPressed: (){}, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, size: 50),
          Text('$nome', style: TextStyle(fontSize: 24)),
        ],
      ),
    )
  );
}