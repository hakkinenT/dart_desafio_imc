import 'package:desafio_imc/exceptions/empty_text_exception.dart';

import 'controller/imc_controller.dart';
import 'models/pessoa.dart';
import 'ui/programa_ui.dart';

void execute() {
  Pessoa pessoa = _obterDadosDaPessoa();

  _verificarClassificacaoIMC(pessoa);
}

Pessoa _obterDadosDaPessoa() {
  final nome = _obterNome();
  final peso = _obterPeso();
  final altura = _obterAltura();

  final pessoa = Pessoa(nome: nome, altura: altura, peso: peso);

  return pessoa;
}

String _obterNome() {
  String nome = "";

  do {
    try {
      nome = ProgramaUI.lerTexto("Informe seu nome: ");
    } on EmptyTextException catch (e) {
      ProgramaUI.imprimirMensagemDeErro(e.message);
      nome = "";
    }
  } while (nome.isEmpty);

  return nome;
}

double _obterPeso() {
  double? peso;

  do {
    peso = ProgramaUI.lerNumero("Informe o peso em quilos: ");
  } while (peso == null);

  return peso;
}

double _obterAltura() {
  double? altura;

  do {
    altura = ProgramaUI.lerNumero("Informe a altura em metros: ");
  } while (altura == null);

  return altura;
}

void _verificarClassificacaoIMC(Pessoa pessoa) {
  IMCController controller = IMCController();

  String result = "";

  try {
    result = controller.classificacaoIMC(pessoa);
    _imprimirResultado(result);
  } on ArgumentError catch (e) {
    ProgramaUI.imprimirMensagemDeErro(e.message);
  }
}

void _imprimirResultado(String result) {
  ProgramaUI.imprimirMessagem('CLASSIFICAÇÃO IMC: ', result);
}
