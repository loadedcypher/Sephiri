import 'package:flutter/material.dart';

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
        // form filed
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
              // Add encryption logic here
              setState(() {
                _encryptedText = 'Encrypted text: ${_textController.text}';
              });
            }
          },
          child: const Text('Encrypt'),
        ),
      ],
    );
  }
}
