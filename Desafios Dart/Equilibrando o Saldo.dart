import 'dart:io';

void main() {
  double saldoAtual = double.parse(stdin.readLineSync()!);
  double valorDeposito = double.parse(stdin.readLineSync()!);
  double valorRetirada = double.parse(stdin.readLineSync()!);

  //TODO: Calcular o saldo atualizado de acordo com a descrição deste desafio.
  double saldo = saldoAtual;
  saldo = saldo + valorDeposito;
  if (saldoAtual >= valorDeposito) {
    saldo = saldo - valorRetirada;
  }

  //TODO: Imprimir o a saída de conforme a tabela de exemplos (uma casa decimal).
  print("Saldo atualizado na conta: ${saldo.toStringAsFixed(1)}");
}
