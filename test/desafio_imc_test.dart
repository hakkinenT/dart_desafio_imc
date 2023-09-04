import 'package:desafio_imc/models/imc.dart';
import 'package:test/test.dart';

void main() {
  group('Classificacao IMC', () {
    double pesoValido = 60.0;
    double alturaValida = 1.61;

    double pesoNegativo = -1 * pesoValido;
    double alturaNegativa = -1 * alturaValida;

    double alturaInvalida = 0.0;

    test(
        'deve retornar a classificação IMC se o peso e a altura forem positivos',
        () {
      String result = IMC.classificacao(pesoValido, alturaValida);
      expect(result, equals("Saudável"));
    });

    test(
        'deve retornar a classificação IMC se o peso e a altura forem negativos',
        () {
      String result = IMC.classificacao(pesoNegativo, alturaNegativa);
      expect(result, equals("Saudável"));
    });

    test('deve retornar um erro se a altura for igual a 0', () {
      expect(
        () => IMC.classificacao(pesoNegativo, alturaInvalida),
        throwsA(
          TypeMatcher<ArgumentError>(),
        ),
      );
    });
  });
}
