import 'package:flutter/material.dart';
import 'package:sephiri_frontend/fragments/decrypt_file_analysis.dart';
import 'package:sephiri_frontend/fragments/decrypt_file_key.dart';

class DecryptFile extends StatefulWidget {
  const DecryptFile({super.key});

  @override
  State<DecryptFile> createState() => _DecryptFileState();
}

class _DecryptFileState extends State<DecryptFile> {
  String? _decryptionMethod;

  List<String> methods = [
    'Decryption Using a Key',
    'Decryption Using Frequency Analysis'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: methods.map((method) {
            return RadioMenuButton(
              child: Text(method),
              value: method,
              groupValue: _decryptionMethod,
              onChanged: (value) => setState(() => _decryptionMethod = value),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 10.0,
        ),
        if (_decryptionMethod == 'Decryption Using a Key')
          const DecryptFileKey(),
        if (_decryptionMethod == 'Decryption Using Frequency Analysis')
          const DecryptFileAnalysis(),
      ],
    );
  }
}
