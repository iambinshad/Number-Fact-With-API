import 'dart:developer';

import 'package:http/http.dart' as http;

Future<void> getNumberFact({required String number}) async {
  final _response =
      await http.get(Uri.parse('http://numbersapi.com/$number?json'));
  log(_response.body);
}
