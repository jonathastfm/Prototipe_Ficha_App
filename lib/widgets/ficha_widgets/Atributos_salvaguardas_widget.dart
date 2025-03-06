import 'package:flutter/material.dart';

import '../../classes/Personagem.dart';

class AtributosSalvaguardasWidget extends StatelessWidget {
  final Personagem personagem;

  const AtributosSalvaguardasWidget({super.key, required this.personagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
            _buildSalvaguarda("For", personagem.modificadores["For"] ?? 0, "", personagem),
            _buildSalvaguarda("Dex", personagem.modificadores["Dex"] ?? 0, "", personagem),
            _buildSalvaguarda("Con", personagem.modificadores["Con"] ?? 0, "", personagem),
          ]),
          _buildAttributeRow([
            _buildSalvaguarda("Int", personagem.modificadores["Int"] ?? 0, "", personagem),
            _buildSalvaguarda("Sab", personagem.modificadores["Sab"] ?? 0, "", personagem),
            _buildSalvaguarda("Car", personagem.modificadores["Car"] ?? 0, "", personagem),
          ]),
          // Skills Section
          const SizedBox(height: 10),
          const Text("Pericias", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          ...[for (var entry in personagem.proficiencias.entries) _buildSkillButton(entry.key, entry.value)],
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

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

Widget _buildSalvaguarda(String label, int modifier, String value, Personagem personagem) {
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

Widget _buildAttributeRow(List<Widget> attributes) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: attributes,
    );
  }

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