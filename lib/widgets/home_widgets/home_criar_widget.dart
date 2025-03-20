import 'package:ficha_app_01/pages/Create_Page.dart';
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
          buildButton(context, 'Criar Classe'),
          buildButton(context, 'Criar SubClasse'),
          buildButton(context, 'Criar Raça'),
          
        ],
          
      
      ),
    );
  }
}

Widget buildButton(BuildContext context, String nome) {
  return Card(
    color: Colors.grey[200],
    child: MaterialButton(
      
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreatePage()),
        );
      }, 
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