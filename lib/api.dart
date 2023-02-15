import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:number_fact/number_fact_response/number_fact_response.dart';

Future<NumberFactResponse> getNumberFact({required String number}) async {
  final _response =
      await http.get(Uri.parse('http://numbersapi.com/$number?json'));
  final _bodyAsJson = jsonDecode(_response.body) as Map<String, dynamic>;
  final _data = NumberFactResponse.fromJson(_bodyAsJson);
  return _data;
  log(_response.body);
}
