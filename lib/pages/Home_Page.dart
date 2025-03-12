import 'package:ficha_app_01/widgets/home_widgets/home_criar_widget.dart';
import 'package:ficha_app_01/widgets/home_widgets/home_ficha_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> body = <Widget>[
    HomeCriarWidget(),
    HomeFichaWidget(),
    Text(
      'Index 2: Conteudo',
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Home Page'),
      ),
      body: body[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Criar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Fichas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Conteudo',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurpleAccent,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        }),
      );
  }
}