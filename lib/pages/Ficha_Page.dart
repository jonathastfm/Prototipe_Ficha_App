import 'package:ficha_app_01/widgets/ficha_widgets/Atributos_salvaguardas_widget.dart';
import 'package:ficha_app_01/widgets/ficha_widgets/Inventario.dart';
import 'package:ficha_app_01/widgets/ficha_widgets/Magias_Habilidades_Widget.dart';
import 'package:flutter/material.dart';
import '../classes/Personagem.dart';



class FichaPage extends StatefulWidget {
  final Personagem personagem;
  

  const FichaPage({super.key, required this.personagem});

  @override
  State<FichaPage> createState() => _FichaPageState();
}

class _FichaPageState extends State<FichaPage> {

  int dropDownValue = 1;
  @override
  Widget build(BuildContext context) {
    final personagem = widget.personagem;
    return Scaffold(
      appBar: AppBar(
        title: Text(personagem.nome),
        centerTitle: true,
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.purple,
                width: double.infinity,
                child: Text(
                  personagem.nome,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),

              // Character Info
              const SizedBox(height: 10),
              const CircleAvatar(radius: 40, backgroundColor: Colors.grey),
              const SizedBox(height: 10),
              Text("${personagem.classe.nome} ${personagem.nivel}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text("AC : ${personagem.ac}"),
              Text("BP : ${personagem.bp}"),
              Text("Deslocamento : ${personagem.deslocamento}m"),
              Text("init : ${personagem.iniciativa}"),

              // lifeBar
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                  children: [
                    IconButton(
                      icon:Icon(Icons.remove_circle_outline_outlined, color: Colors.black), 
                      color: Colors.black,
                      onPressed: (){},
                      ),
                    Container(
                      width: 200,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    
                    IconButton(
                      icon: Icon(Icons.add_circle_outline), 
                      color: Colors.black,
                      onPressed: () {
                        
                      },
                    ),
                  ],
                ),
              ),
            
              // Attributes Section
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                  padding: const EdgeInsets.all(8),
                  
                  width: double.infinity,
                  child: Center(
                    child: DropdownButton(
                      style: const TextStyle(fontSize: 24),
                      
                      value: dropDownValue,
                      items: const [
                        DropdownMenuItem(value: 1, child: Text("Atributos e salvaguardas")),
                        DropdownMenuItem(value: 2, child: Text("inventario")),
                        DropdownMenuItem(value: 3, child: Text("Magias e Habilidades")),
                        
                      ],
                      onChanged: (value) {
                        setState(() {
                          dropDownValue = value as int;
                        });
                      },
                      
                    ),
                  ),
                ),
              ),
              IndexedStack(
                index: dropDownValue - 1 ,
                children: [
                  AtributosSalvaguardasWidget(personagem: personagem),
                  Inventario(),
                  MagiasHabilidadesWidget(),
            
                ],
              ),
              //container for attributes
              
            
            ],
          ),
        ),
      ),
    );
  }
}


  // Function to build attribute box
  

  

  // Function to build attribute row
  

  // Function to build skill button
  

