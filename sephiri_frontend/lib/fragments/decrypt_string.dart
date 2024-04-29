import 'package:flutter/material.dart';
import 'package:sephiri_frontend/fragments/output_card.dart';
import 'package:sephiri_frontend/functions/api_calls.dart';

class DecryptString extends StatefulWidget {
  const DecryptString({super.key});

  @override
  State<DecryptString> createState() => _DecryptStringState();
}

class _DecryptStringState extends State<DecryptString> {
  final _textController = TextEditingController();
  final _keyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _encryptedText = '';
  String _errorMessage = '';

  Future<void> decrypt(String text, int key) async {
    try {
      String encryptedText = await decryptString(text, key);
      setState(() {
        _encryptedText = encryptedText;
        _errorMessage = '';
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error decrypting text: $e';
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
                const InputDecoration(hintText: 'Enter text to decrypt'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _keyController,
            decoration: const InputDecoration(hintText: 'Enter decryption key'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an decryption key';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                decrypt(
                  _textController.text,
                  int.parse(_keyController.text),
                );
              }
            },
            child: const Text('Decrypt'),
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
