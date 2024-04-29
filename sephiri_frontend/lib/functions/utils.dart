import 'dart:io';

Future<String> readFile(String filePath) async {
  try {
    final file = File('path/to/file.txt');
    final contents = await file.readAsString();
    return contents;
  } catch (e) {
    return "$e";
  }
}

Future<void> writeFile(String filePath, String contents) async {
  try {
    final file = File(filePath);
    await file.writeAsString(contents);
    print('File written successfully!');
  } catch (e) {
    print('Error writing file: $e');
  }
}
