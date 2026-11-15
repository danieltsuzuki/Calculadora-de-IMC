import 'dart:convert';
import 'dart:io';

import 'package:dio_desafio_imc_dart/exceptions/input-exception.dart';
import 'package:dio_desafio_imc_dart/models/pessoa.dart';
import 'package:dio_desafio_imc_dart/patterns/imc-strategy.dart';

class ImcService {
  final ImcStrategy _strategy;

  ImcService([ImcStrategy? strategy])
    : _strategy = strategy ?? ImcPessoaStrategy();

  double calcularImc(double peso, double altura) {
    return double.parse((peso / (altura * altura)).toStringAsFixed(2));
  }

  Pessoa capturarEntrada() {
    print("Digite seu nome:");
    String nome = stdin.readLineSync(encoding: utf8) ?? "";
    if (nome.trim() == "") {
      throw InputException("nome inválido!");
    }

    print("Digite seu peso:");
    double? peso = double.tryParse(
      normalizarDouble(stdin.readLineSync() ?? ""),
    );
    if (peso == null || peso == 0.0) {
      throw InputException("Peso inválido!");
    }

    print("Digite sua altura:");
    double? altura = double.tryParse(
      normalizarDouble(stdin.readLineSync() ?? ""),
    );
    if (altura == null || peso == 0.0) {
      throw InputException("Altura inválida!");
    }

    return Pessoa(nome, peso, altura);
  }

  String gerarClassificacao(double imc) {
    return _strategy.classificar(imc).getDescricao();
  }

  void printarResultado(Pessoa pessoa, double imc, String classificacao) {
    print("$pessoa\nIMC: $imc\nClassificação: $classificacao");
  }

  String normalizarDouble(String valor) {
    return valor.replaceAll(",", ".");
  }
}
