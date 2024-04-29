import 'dart:developer';
import 'dart:io';

Future<String> readFile(String? filePath) async {
  try {
    final file = File(filePath!);
    final contents = await file.readAsString();
    return contents;
  } catch (e) {
    return "$e";
  }
}

Future<void> writeFile(
    String filePath, String filename, String contents) async {
  try {
    final file = File('$filePath/$filename');
    await file.writeAsString(contents);
  } catch (e) {
    log('$e');
  }
}
