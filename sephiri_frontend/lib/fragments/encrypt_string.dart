import 'package:flutter/material.dart';
import 'package:sephiri_frontend/fragments/output_card.dart';
import 'package:sephiri_frontend/functions/api_calls.dart';

class EncryptString extends StatefulWidget {
  const EncryptString({super.key});

  @override
  State<EncryptString> createState() => _EncryptStringState();
}

class _EncryptStringState extends State<EncryptString> {
  final _textController = TextEditingController();
  final _keyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _encryptedText = '';
  String _errorMessage = '';

  Future<void> encrypt(String text, int key) async {
    try {
      String encryptedText = await encryptString(text, key);
      setState(() {
        _encryptedText = encryptedText;
        _errorMessage = '';
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error encrypting text: $e';
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
            controller: _textController,
            decoration:
                const InputDecoration(hintText: 'Enter text to encrypt'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _keyController,
            decoration: const InputDecoration(hintText: 'Enter encryption key'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an encryption key';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                encrypt(
                  _textController.text,
                  int.parse(_keyController.text),
                );
              }
            },
            child: const Text('Encrypt'),
          ),
          if (_errorMessage.isNotEmpty)
            Text(
              _errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          OutputCard(outputText: _encryptedText)
        ],
      ),
    );
  }
}
