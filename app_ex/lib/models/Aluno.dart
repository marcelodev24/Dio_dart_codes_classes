// ignore_for_file: file_names

class Aluno {
  String _nome = '';
  final List<double> _notas = [];

  Aluno(this._nome);

  void setNome(nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  List<double> getNotas() {
    return _notas;
  }

  void addNota(double nota) {
    _notas.add(nota);
  }

  double lerMedia() {
    var media =
        _notas.reduce((value, element) => value + element) / _notas.length;

    return media.isNaN ? 0 : media;
  }

  bool aprovado(double notaCorte) {
    return lerMedia() >= notaCorte;
  }
}
