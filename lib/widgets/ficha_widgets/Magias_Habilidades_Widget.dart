

import 'package:flutter/material.dart';
// Adjust the import path as necessary

class MagiasHabilidadesWidget extends StatefulWidget {
  const MagiasHabilidadesWidget({super.key});

  @override
  State<MagiasHabilidadesWidget> createState() => _MagiasHabilidadesWidgetState();
}

class _MagiasHabilidadesWidgetState extends State<MagiasHabilidadesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryButton('Magias'),
          const MagiaItem(),
          const MagiaItem(),
        ]
      )
    );
  }
}

class MagiaItem extends StatelessWidget {
  const MagiaItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[300],
        ),
        child: ExpansionTile(
          title: const Text('Magia'),
          subtitle: const Text('Descrição da magia'),
          children: const [
            Text('Nível: 1'),
            Text('Escola: Abjuração'),
            Text('Tempo de Conjuração: 1 ação'),
            Text('Alcance: 30 pés'),
            Text('Componentes: V, S, M (um pouco de pó de ferro)'),
            Text('Duração: Concentração, até 1 minuto'),
          ],
        )
      ),
    );
  }
}

  Widget _buildCategoryButton(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
