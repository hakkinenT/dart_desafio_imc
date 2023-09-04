import 'dart:convert';
import 'dart:io';

import 'package:desafio_imc/exceptions/empty_text_exception.dart';

class ProgramaUI {
  static String lerTexto([String? messagemDeEntrada]) {
    if (messagemDeEntrada != null) {
      print(messagemDeEntrada);
    }

    String line = stdin.readLineSync(encoding: utf8) ?? "";

    if (line.isEmpty) {
      throw EmptyTextException();
    }

    return line;
  }

  static double? lerNumero([String? inputMessage]) {
    double? valor;

    try {
      final texto = lerTexto(inputMessage);
      valor = double.parse(texto);
    } on FormatException {
      imprimirMensagemDeErro("Informe um número válido.");
    } on EmptyTextException {
      imprimirMensagemDeErro("O valor não pode ser nulo.");
    }

    return valor;
  }

  static void imprimirMessagem(String titulo, String mensagemSaida,
      [String emojiUnicode = '\u{25B6}']) {
    print('\n');
    print("*************************************");
    print('$emojiUnicode $titulo');
    print(mensagemSaida);
    print("*************************************");
    print('\n');
  }

  static void imprimirMensagemDeErro(String mensagemError) {
    imprimirMessagem('ERROR', mensagemError, '\u{1F6A8}');
  }
}
