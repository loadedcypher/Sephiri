import 'package:http/http.dart' as http;

String endpoint = 'https://localhost:8080/api';

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
