import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sephiri_frontend/fragments/output_card.dart';
import 'package:sephiri_frontend/functions/api_calls.dart';
import 'package:sephiri_frontend/functions/utils.dart';

class DecryptFileKey extends StatefulWidget {
  const DecryptFileKey({super.key});

  @override
  State<DecryptFileKey> createState() => _DecryptFileKeyState();
}

class _DecryptFileKeyState extends State<DecryptFileKey> {
  final _keyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _selectedFile;
  String _outputText = '';
  String _errorMessage = '';

  Future<void> decrypt(String text, int key) async {
    try {
      String decryptedText = await decryptString(text, key);
      setState(() {
        _outputText = decryptedText;
        _errorMessage = '';
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error encrypting text: $e';
      });
    }
  }

  Future<void> read(String filepath) async {
    try {
      String contents = await readFile(filepath);
      setState(() {
        _outputText = contents;
        _errorMessage = '';
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error reading file: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _keyController,
            decoration: const InputDecoration(hintText: 'Enter decryption key'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a decryption key';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();
                  if (result != null) {
                    setState(() {
                      _selectedFile = result.files.single.path!;
                      read(_selectedFile!);
                    });
                  }
                },
                child: Text(_selectedFile == null
                    ? 'Choose File'
                    : _selectedFile!.split('/').last),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (_outputText.isEmpty) {
                  setState(() {
                    _errorMessage = 'Please read a file before decrypting';
                  });
                } else {
                  decrypt(_outputText, int.parse(_keyController.text));
                }
              }
            },
            child: const Text('Decrypt'),
          ),
          if (_errorMessage.isNotEmpty)
            Text(
              _errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          OutputCard(outputText: _outputText)
        ],
      ),
    );
  }
}
