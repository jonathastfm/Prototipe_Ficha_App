class Habilidade {
  String nome;
  String descricao;
  int nivel;

  Habilidade({required this.nome, required this.descricao, required this.nivel});

  void aumentarNivel() {
    nivel++;
  }

  @override
  String toString() {
    return 'Habilidade: $nome, Descrição: $descricao, Nível: $nivel';
  }
}