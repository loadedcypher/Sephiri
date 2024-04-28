import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class EncryptFile extends StatefulWidget {
  const EncryptFile({super.key});

  @override
  State<EncryptFile> createState() => _EncryptFileState();
}

class _EncryptFileState extends State<EncryptFile> {
  final _formKey = GlobalKey<FormState>();
  final _keyController = TextEditingController();
  File? _selectedFile;
  String _encryptedText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              setState(() {
                _selectedFile = File(result.files.single.path!);
              });
            }
          },
          child: Text(_selectedFile == null
              ? 'Choose File'
              : _selectedFile!.path.split('/').last),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Add encryption logic here
              setState(() {
                _encryptedText = 'Encrypted file: ${_selectedFile!.path}';
              });
            }
          },
          child: const Text('Encrypt'),
        ),
      ],
    );
  }
}
