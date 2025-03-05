import 'package:flutter/material.dart';

import '../classes/Personagem.dart';



class FichaPage extends StatelessWidget {
  final Personagem personagem;

  const FichaPage({super.key, required this.personagem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text("${personagem.classe.name} ${personagem.nivel}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text("AC : ${personagem.ac}"),
              Text("BP : ${personagem.bp}"),
              Text("Deslocamento : ${personagem.deslocamento}m"),
              Text("init : ${personagem.iniciativa}"),

              // Progress Bar & Star Icon
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
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.grey[300],
                width: double.infinity,
                child: const Text(
                  "Atributos",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 5),
              const Text("Atributos", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

              _buildAttributeRow([
                _buildAtributo("For", personagem.modificadores["For"].toString(), personagem.atributos["For"].toString()),
                _buildAtributo("Dex", personagem.modificadores["Dex"].toString(), personagem.atributos["Dex"].toString()),
                _buildAtributo("Con", personagem.modificadores["Con"].toString(), personagem.atributos["Con"].toString()),
              ]),
                _buildAttributeRow([
                _buildAtributo("Int", personagem.modificadores["Int"].toString(), personagem.atributos["Int"].toString()),
                _buildAtributo("Sab", personagem.modificadores["Sab"].toString(), personagem.atributos["Sab"].toString()),
                _buildAtributo("Car", personagem.modificadores["Car"].toString(), personagem.atributos["Car"].toString()),
              ]),

              // Saving Throws
              const SizedBox(height: 10),
              const Text("Salvaguardas", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                _buildAttributeRow([
                _buildSalvaguarda("For", personagem.modificadores["For"] ?? 0, ""),
                _buildSalvaguarda("Dex", personagem.modificadores["Dex"] ?? 0, ""),
                _buildSalvaguarda("Con", personagem.modificadores["Con"] ?? 0, ""),
                ]),
                _buildAttributeRow([
                _buildSalvaguarda("Int", personagem.modificadores["Int"] ?? 0, ""),
                _buildSalvaguarda("Sab", personagem.modificadores["Sab"] ?? 0, ""),
                _buildSalvaguarda("Car", personagem.modificadores["Car"] ?? 0, ""),
                ]),
              

              // Skills Section
              const SizedBox(height: 10),
              const Text("Pericias", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              ...[for (var entry in personagem.proficiencias.entries) _buildSkillButton(entry.key, entry.value)],
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }



  // Function to build attribute box
  Widget _buildAtributo(String label, String modifier, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(modifier, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildSalvaguarda(String label, int modifier, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          
            Text((modifier + (personagem.salvaguardas[label]! ? personagem.bp : 0)).toString(), style: const TextStyle(fontSize: 14)),

          Checkbox(value: personagem.salvaguardas[label] , onChanged: (value) {}),

        ],
      ),
    );
  }

  // Function to build attribute row
  Widget _buildAttributeRow(List<Widget> attributes) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: attributes,
    );
  }

  // Function to build skill button
  Widget _buildSkillButton(String skillName, bool isProficient) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              skillName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Checkbox(value: isProficient, onChanged: (value) {}),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
