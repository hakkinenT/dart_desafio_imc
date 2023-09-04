class Pessoa {
  final String nome;
  final double altura;
  final double peso;

  const Pessoa({required this.nome, required this.altura, required this.peso});

  Pessoa copyWith({String? nome, double? altura, double? peso}) {
    return Pessoa(
        nome: nome ?? this.nome,
        altura: altura ?? this.altura,
        peso: peso ?? this.peso);
  }
}
