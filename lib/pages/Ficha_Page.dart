import 'package:flutter/material.dart';

import '../classes/Personagen.dart';



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
              Text("${personagem.classe} ${personagem.nivel}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                  children: [
                    Container(
                      width: 80,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.star, color: Colors.black),
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
                _buildAttribute("For", _calculateModifier(personagem.atributos["For"]!), personagem.atributos["For"].toString()),
                _buildAttribute("Dex", _calculateModifier(personagem.atributos["Dex"]!), personagem.atributos["Dex"].toString()),
                _buildAttribute("Con", _calculateModifier(personagem.atributos["Con"]!), personagem.atributos["Con"].toString()),
              ]),
              _buildAttributeRow([
                _buildAttribute("Int", _calculateModifier(personagem.atributos["Int"]!), personagem.atributos["Int"].toString()),
                _buildAttribute("Sab", _calculateModifier(personagem.atributos["Sab"]!), personagem.atributos["Sab"].toString()),
                _buildAttribute("Car", _calculateModifier(personagem.atributos["Car"]!), personagem.atributos["Car"].toString()),
              ]),

              // Saving Throws
              const SizedBox(height: 10),
              const Text("Salvaguardas", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              _buildAttributeRow([
                _buildAttribute("For", personagem.salvaguardas["For"]! ? "✓" : "✗", ""),
                _buildAttribute("Dex", personagem.salvaguardas["Dex"]! ? "✓" : "✗", ""),
                _buildAttribute("Con", personagem.salvaguardas["Con"]! ? "✓" : "✗", ""),
              ]),
              _buildAttributeRow([
                _buildAttribute("Int", personagem.salvaguardas["Int"]! ? "✓" : "✗", ""),
                _buildAttribute("Sab", personagem.salvaguardas["Sab"]! ? "✓" : "✗", ""),
                _buildAttribute("Car", personagem.salvaguardas["Car"]! ? "✓" : "✗", ""),
              ]),

              // Skills Section
              const SizedBox(height: 10),
              const Text("Pericias", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              ...personagem.proficiencias.entries.map((entry) => _buildSkillButton(entry.key, entry.value)).toList(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Function to calculate attribute modifier
  String _calculateModifier(int value) {
    int modifier = (value - 10) ~/ 2;
    return (modifier >= 0 ? "+" : "") + modifier.toString();
  }

  // Function to build attribute box
  Widget _buildAttribute(String label, String modifier, String value) {
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
