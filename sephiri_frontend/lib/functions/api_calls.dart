import 'package:http/http.dart' as http;
import 'dart:convert';

// A request to call the encrypt string function

Future<String> encryptString(String text, int encryptionKey) async {
  final url = Uri.parse('https://localhost:8080/data');
  final body = jsonEncode({'text': text, 'key': encryptionKey});

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: body,
  );

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
