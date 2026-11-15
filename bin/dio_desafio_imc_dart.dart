import 'package:dio_desafio_imc_dart/models/pessoa.dart';
import 'package:dio_desafio_imc_dart/services/imc-service.dart';

void main(List<String> arguments) {
  ImcService service = ImcService();
  Pessoa pessoa = service.capturarEntrada();
  double imc = service.calcularImc(pessoa.getPeso(), pessoa.getAltura());
  String classificacao = service.gerarClassificacao(imc);
  service.printarResultado(pessoa, imc, classificacao);
}
