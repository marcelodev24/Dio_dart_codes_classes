class Pessoa {
  String _nome = '';

  void setNome(nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  Pessoa(String nome) {
    _nome = nome;
  }
}
