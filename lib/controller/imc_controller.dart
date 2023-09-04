import 'package:desafio_imc/models/imc.dart';

import '../models/pessoa.dart';

class IMCController {
  String classificacaoIMC(Pessoa pessoa) {
    try {
      return IMC.classificacao(pessoa.peso, pessoa.altura);
    } on ArgumentError {
      rethrow;
    }
  }
}
