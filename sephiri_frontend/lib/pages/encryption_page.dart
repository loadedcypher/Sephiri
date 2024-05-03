import 'package:flutter/material.dart';
import 'package:sephiri_frontend/fragments/encrypt_file.dart';
import 'package:sephiri_frontend/fragments/encrypt_string.dart';

class EncryptionPage extends StatefulWidget {
  const EncryptionPage({super.key});

  @override
  _EncryptionPageState createState() => _EncryptionPageState();
}

class _EncryptionPageState extends State<EncryptionPage> {
  final _formKey = GlobalKey<FormState>();
  String _selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButton<String>(
                value: _selectedOption,
                onChanged: (newValue) {
                  setState(() {
                    _selectedOption = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: '',
                    child: Text('What do you want to encrypt'),
                  ),
                  DropdownMenuItem(
                    value: 'Encrypt String',
                    child: Text('Encrypt String'),
                  ),
                  DropdownMenuItem(
                    value: 'Encrypt File',
                    child: Text('Encrypt File'),
                  ),
                ],
              ),
              if (_selectedOption == 'Encrypt String') const EncryptString(),
              if (_selectedOption == 'Encrypt File') const EncryptFile(),
            ],
          ),
        ),
      ),
    );
  }
}
