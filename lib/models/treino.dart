class Treino {
  String id;
  String nome;
  List<Exercicio> exercicios;

  Treino({required this.id, required this.nome, required this.exercicios});
}

class Exercicio {
  String nome;
  int quantidadeSeries;
  int quantidadeRepeticoes;
  double peso;
  int tempoDescanso;
  String observacao;
  String imagem;

  Exercicio({
    required this.nome,
    required this.quantidadeSeries,
    required this.quantidadeRepeticoes,
    required this.peso,
    required this.tempoDescanso,
    required this.observacao,
    required this.imagem,
  });
}
