import 'package:flutter/material.dart';
import 'package:sephiri_frontend/fragments/decrypt_file.dart';
import 'package:sephiri_frontend/fragments/decrypt_string.dart';

class DecryptionPage extends StatefulWidget {
  const DecryptionPage({super.key});

  @override
  _DecryptionPageState createState() => _DecryptionPageState();
}

class _DecryptionPageState extends State<DecryptionPage> {
  final _formKey = GlobalKey<FormState>();
  String _selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                    child: Text('What do you want to decrypt?'),
                  ),
                  DropdownMenuItem(
                    value: 'Decrypt String',
                    child: Text('Decrypt String'),
                  ),
                  DropdownMenuItem(
                    value: 'Decrypt File',
                    child: Text('Decrypt File'),
                  ),
                ],
              ),
              if (_selectedOption == 'Decrypt String') const DecryptString(),
              if (_selectedOption == 'Decrypt File') const DecryptFile(),
            ],
          ),
        ),
      ),
    );
  }
}
