import 'package:ficha_app_01/classes/DndClass.dart';

class Personagem {
  String nome;
  int idade;
  int nivel = 1;
  int ac = 10;
  int bp = 1;
  String raca;
  DnDClass classe;
  int deslocamento = 9;
  int iniciativa = 0;


  //map vars
  Map<String, int> atributos;

  late Map<String, int> modificadores;

  Map<String, bool> salvaguardas = {
    
    "For": false,
    "Dex": false,
    "Con": false,
    "Int": false,
    "Sab": false,
    "Car": false,
    
  };
  
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
    
    
  }){
    setModificadores();
  }
  
  void setModificadores(){
      modificadores = {
        "For": ((atributos["For"] ?? 0) - 10) ~/ 2,
        "Dex": ((atributos["Dex"] ?? 0) - 10) ~/ 2,
        "Con": ((atributos["Con"] ?? 0) - 10) ~/ 2,
        "Int": ((atributos["Int"] ?? 0) - 10) ~/ 2,
        "Sab": ((atributos["Sab"] ?? 0) - 10) ~/ 2,
        "Car": ((atributos["Car"] ?? 0) - 10) ~/ 2,
      };
    }

  void adicionarSalvaguarda(String salvaguarda) {
    salvaguardas[salvaguarda] = true;
  }

  

  void removerSalvaguarda(String salvaguarda) {
    salvaguardas[salvaguarda] = false;
  }

  void adicionarAtributo(String atributo, int valor) {
    atributos[atributo] = valor;
  }
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