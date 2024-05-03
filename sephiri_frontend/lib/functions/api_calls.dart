import 'dart:convert';

import 'package:http/http.dart' as http;

// A request to call the encrypt string function

Future<String> encryptString(String text, int encryptionKey) async {
  final url = Uri.parse(
      'http://localhost:8080/api/encryptString?text=$text&key=$encryptionKey');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the response body as a string.
    print(response.body);
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

Future<String> decryptString(String text, int decryptionKey) async {
  final url = Uri.parse(
      'http://localhost:8080/api/decryptString?encryptedText=$text&key=$decryptionKey');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the response body as a string.
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

Future<Map<String, dynamic>> decryptWithAnalysis(String filename) async {
  final url = Uri.parse('http://localhost:8080/api/analyse?filename=$filename');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then decode the body into a map using a json serializer.
    print(json.decode(response.body));
    return json.decode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}
