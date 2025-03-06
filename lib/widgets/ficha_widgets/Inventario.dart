import 'package:flutter/material.dart';

class Inventario extends StatelessWidget {
  const Inventario({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Moedas'),
          Container(
            decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[300],
            ),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CurrencyBox(label: 'Pc'),
                CurrencyBox(label: 'Pp'),
                CurrencyBox(label: 'Pg'),
              ],
            ),
          ),
          const SectionTitle(title: 'Equipamentos'),
          Column(
            children: List.generate(
              4,
              (index) => const EquipmentItem(label: 'Espada'),
            ),
          ),
          const SectionTitle(title: 'Itens'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              4,
              (index) => const ItemIcon(),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CurrencyBox extends StatelessWidget {
  final String label;

  const CurrencyBox({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label),
    );
  }
}

class EquipmentItem extends StatelessWidget {
  final String label;

  const EquipmentItem({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}

class ItemIcon extends StatelessWidget {
  const ItemIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
