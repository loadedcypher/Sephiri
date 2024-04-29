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
  String _encryptedText = '';
  String _text = '';
  int _key = 0;

  Future<void> encrypt(String text, int key) async {
    String encryptedText = await encryptString(text, key);
    setState(() {
      _encryptedText = encryptedText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Input field to enter the text to be encrypted
        TextFormField(
          controller: _textController,
          decoration: const InputDecoration(hintText: 'Enter text to encrypt'),
          onChanged: (value) {
            _text = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        // Input field to enter the encryption key.
        TextFormField(
          controller: _keyController,
          decoration: const InputDecoration(hintText: 'Enter encryption key'),
          onChanged: (value) {
            _key = int.parse(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an encryption key';
            }
            return null;
          },
        ),
        ElevatedButton(
          onPressed: () => encrypt(_text, _key),
          child: const Text('Encrypt'),
        ),

        OutputCard(outputText: _encryptedText)
      ],
    );
  }
}
