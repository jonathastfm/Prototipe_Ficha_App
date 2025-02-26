import 'package:ficha_app_01/classes/DndClass.dart';

class Personagem {
  String nome;
  int idade;
  String raca;
  DnDClass classe;
  Map<String, int> atributos;

  
  List<String> proficiencias;

  Personagem({
    required this.nome,
    required this.idade,
    required this.raca,
    required this.classe,
    required this.proficiencias,
    required this.atributos,
  });

  void adicionarProficiencia(String proficiencia) {
    proficiencias.add(proficiencia);
  }

  void removerProficiencia(String proficiencia) {
    proficiencias.remove(proficiencia);
  }

  @override
  String toString() {
    return 'Personagem(nome: $nome, idade: $idade, raca: $raca, classe: $classe, proficiencias: $proficiencias)';
  }
}