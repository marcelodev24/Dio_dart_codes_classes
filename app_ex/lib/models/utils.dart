import 'dart:convert';
import 'dart:io';

class ConsoleUtils {
  static String lerString(text) {
    print(text);
    return ler();
  }

  static String ler() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static double? lerDouble() {
    var value = ler();
    try {
      return double.parse(value);
    } catch (e) {
      return null;
    }
  }

  static double? lerDoublecomtexto(String tex) {
    print(tex);
    return lerDouble();
  }

  static double? lerDoublecomtextocomsaida(String tex, String valorSaida) {
    do {
      try {
        var value = lerString(tex);
        if (value == valorSaida) {
          return null;
        }
        return double.parse(value);
      } catch (e) {
        print(tex);
      }
    } while (true);
  }
}
