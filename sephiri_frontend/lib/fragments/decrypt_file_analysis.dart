import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sephiri_frontend/fragments/output_card.dart';
import 'package:sephiri_frontend/functions/api_calls.dart';
import 'package:sephiri_frontend/functions/utils.dart';

class DecryptFileAnalysis extends StatefulWidget {
  const DecryptFileAnalysis({super.key});

  @override
  State<DecryptFileAnalysis> createState() => _DecryptFileAnalysisState();
}

class _DecryptFileAnalysisState extends State<DecryptFileAnalysis> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedFile;
  String _outputText = '';
  String _errorMessage = '';

  Future<void> encrypt(String text, int key) async {
    try {
      String encryptedText = await encryptString(text, key);
      setState(() {
        _outputText = encryptedText;
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
                  encrypt(_outputText, 9);
                }
              }
            },
            child: const Text('Decrypt using file analysis'),
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