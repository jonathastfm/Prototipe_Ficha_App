import 'package:ficha_app_01/classes/DndClass.dart';
import 'package:ficha_app_01/classes/Personagem.dart';
import 'package:ficha_app_01/pages/Ficha_Page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  

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
                  MaterialPageRoute(builder: (context) => FichaPage(   personagem: null!)),
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