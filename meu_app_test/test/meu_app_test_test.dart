import 'dart:ffi';

import 'package:meu_app_test/meu_app_test.dart';
import 'package:test/test.dart';

void main() {
  test('Calcula o valor do produto com desconto sem porcetagem', () {
    expect(calculorDesconto(1000, 150, false), 850);
  });

  test('Calcula o valor do produto com desconto com porcetagem', () {
    expect(calculorDesconto(1000, 15, true), 850);
  });
  test(
      'Calcula o valor do produto com desconto sem porcetagem valor do produto zerado',
      () {
    expect(() => calculorDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });
  group("Calcula o valor do produto com desconto", () {
    var valuesToTest = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}: 850,
      {'valor': 1000, 'desconto': 15, 'percentual': true}: 850
    };
    valuesToTest.forEach((value, expected) {
      test('Entrada: $value: Esperado: $expected', () {
        expect(
            calculorDesconto(
                double.parse(value['valor'].toString()),
                double.parse(value['desconto'].toString()),
                bool.parse(value['percentual'].toString())),
            equals(expected));
      });
    });
  });
}
