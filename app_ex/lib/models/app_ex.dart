import 'package:app_ex/models/Aluno.dart';

import 'utils.dart';

void execute() {
  print("Bem vindo ao sistema de notas!");
  var aluno = Aluno(ConsoleUtils.lerString('Digite o nome do aluno: '));
  aluno.getNome();
  double? nota;
  do {
    nota = ConsoleUtils.lerDoublecomtextocomsaida(
        'Digite a nota ou S para sair', 'S');
    if (nota != null) {
      aluno.addNota(nota);
    }
  } while (nota != null);
  print("As notas digitadas foram: ${aluno.getNotas()}");
  print("A média do aluno foi: ${aluno.lerMedia()}");
  if (aluno.aprovado(7)) {
    print("O aluno ${aluno.getNome()} aprovado");
  } else {
    print("O aluno ${aluno.getNome()} reprovado");
  }
}
