import 'package:flutter/material.dart';
import 'package:sephiri_frontend/functions/api_calls.dart';

class EncryptString extends StatefulWidget {
  const EncryptString({super.key});

  @override
  State<EncryptString> createState() => _EncryptStringState();
}

class _EncryptStringState extends State<EncryptString> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final _keyController = TextEditingController();
  String _encryptedText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Input field to enter the text to be encrypted
        TextFormField(
          controller: _textController,
          decoration: const InputDecoration(hintText: 'Enter text to encrypt'),
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
              setState(() async {
                _encryptedText = await encryptString(
                    _textController.text, int.parse(_keyController.text));
              });
            }
            print(_encryptedText);
          },
          child: const Text('Encrypt'),
        ),
      ],
    );
  }
}
