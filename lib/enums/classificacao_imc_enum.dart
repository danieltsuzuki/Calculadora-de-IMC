enum ClassificacaoImcEnum {
  MAGREZA_GRAVE('Magreza Grave'),
  MAGREZA_MODERADA('Magreza Moderada'),
  MAGREZA_LEVE('Magreza Leve'),
  SAUDAVEL('Saudável'),
  SOBREPESO('Sobrepeso'),
  OBESIDADE_GRAU_I("Obesidade grau I"),
  OBESIDADE_GRAU_II("Obesidade grau II"),
  OBESIDADE_GRAU_III("Obesidade grau III");

  final String _descricao;

  const ClassificacaoImcEnum(this._descricao);

  String getDescricao() {
    return _descricao;
  }
}
