import 'package:dio_desafio_imc_dart/enums/classificacao_imc_enum.dart';

abstract interface class ImcStrategy {
  ClassificacaoImcEnum classificar(double imc);
}

class ImcPessoaStrategy implements ImcStrategy {
  @override
  ClassificacaoImcEnum classificar(double imc) {
    return switch (imc) {
      < 16.0 => ClassificacaoImcEnum.MAGREZA_GRAVE,
      < 17.0 => ClassificacaoImcEnum.MAGREZA_MODERADA,
      < 18.5 => ClassificacaoImcEnum.MAGREZA_LEVE,
      < 25.0 => ClassificacaoImcEnum.SAUDAVEL,
      < 30.0 => ClassificacaoImcEnum.SOBREPESO,
      < 35.0 => ClassificacaoImcEnum.OBESIDADE_GRAU_I,
      < 40.0 => ClassificacaoImcEnum.OBESIDADE_GRAU_II,
      _ => ClassificacaoImcEnum.OBESIDADE_GRAU_III,
    };
  }
}
