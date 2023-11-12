import 'package:meu_app_test/classes/viacep.dart';
import 'package:meu_app_test/meu_app_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'meu_app_test_test.mocks.dart';

@GenerateMocks([MocikViaCep])
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

  group(
      "Calcula o valor do produto informando valares zerados, deve gerar e erro",
      () {
    var valuesToTest = {
      {'valor': 0, 'desconto': 150, 'percentual': false},
      {'valor': 1000, 'desconto': 0, 'percentual': true}
    };

    for (var value in valuesToTest) {
      test('Entrada: $value', () {
        expect(
            () => calculorDesconto(
                double.parse(value['valor'].toString()),
                double.parse(value['desconto'].toString()),
                value['percentual'] == true),
            throwsA(TypeMatcher<ArgumentError>()));
      });
    }
  });

  test('Testar conversão para uppercase', () {
    expect(converToUpper("dio"), equals("DIO"));
  });

  test('Testar conversão para uppercase teste 2', () {
    expect(converToUpper("dio"), equalsIgnoringCase("dio"));
  });

  test('comça com', () {
    expect(converToUpper("dio"), startsWith("d"));
  });

  test('Valor diferente', () {
    expect(retornaValor(50), isNot(equals(49)));
  });

  test('Retorna CEP', () async {
    //MockMocikViaCep mockMocikViaCep = MockMocikViaCep();
    ViaCep viaCep = ViaCep();
    var body = await viaCep.retornarCEP("58187000");
    expect(body['uf'], equals('PB'));
    expect(body['ddd'], equals('83'));
  });
}

class MocikViaCep extends Mock implements ViaCep {}
