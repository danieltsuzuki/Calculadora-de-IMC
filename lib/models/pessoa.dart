class Pessoa {
  final String _nome;
  final double _peso;
  final double _altura;

  Pessoa(this._nome, this._peso, this._altura);

  String getNome() {
    return _nome;
  }

  double getPeso() {
    return _peso;
  }

  double getAltura() {
    return _altura;
  }

  @override
  String toString() {
    return "Nome: $_nome, Peso: $_peso, Altura: $_altura";
  }
}
