import 'package:ficha_app_01/classes/DndClass.dart';

class Personagem {
  String nome;
  int idade;
  int nivel = 1;
  int ac = 10;
  int bp = 0;
  String raca;
  DnDClass classe;
  Map<String, int> atributos;
  Map<String, bool> salvaguardas = {};
  int deslocamento = 9;
  int iniciativa = 0;

  
  Map<String,bool> proficiencias = {
    "Acrobacia": false,
    "Adestrar Animais": false,
    "Arcanismo": false,
    "Atletismo": false,
    "Enganação": false,
    "História": false,
    "Intuição": false,
    "Intimidação": false,
    "Medicina": false,
    "Natureza": false,
    "Percepção": false,
    "Atuação": false,
    "Persuasão": false,
    "Religião": false,
    "Furtividade": false,
    "Prestidigitação": false,
    "Sobrevivência": false,
  };

  Personagem({
    required this.nome,
    required this.idade,
    required this.raca,
    required this.classe,
    required this.proficiencias,
    required this.atributos,
    required this.salvaguardas,
    
  });

  void adicionarProficiencia(String proficiencia) {
    proficiencias[proficiencia] = true;
  }

  void removerProficiencia(String proficiencia) {
    proficiencias[proficiencia] = false;
  }

  @override
  String toString() {
    return 'Personagem(nome: $nome, idade: $idade, raca: $raca, classe: $classe, proficiencias: $proficiencias)';
  }
}