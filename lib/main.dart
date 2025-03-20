
import 'package:ficha_app_01/pages/Home_Page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const FichaApp());
}

class FichaApp extends StatelessWidget {
  const FichaApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      
      home: HomePage(),

    );
  }
}