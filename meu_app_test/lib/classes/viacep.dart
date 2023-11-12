import 'dart:convert';

import 'package:http/http.dart' as http;

class ViaCep {
  Future<Map<dynamic, dynamic>> retornarCEP(String cep) async {
    var retorno =
        await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    var decodeResponse = jsonDecode(utf8.decode(retorno.bodyBytes)) as Map;
    print(decodeResponse);
    return decodeResponse;
  }
}
