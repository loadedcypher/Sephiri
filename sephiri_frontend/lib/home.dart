import 'package:flutter/material.dart';
import 'package:sephiri_frontend/pages/decryption_page.dart';
import 'package:sephiri_frontend/pages/encryption_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sephiri Cryptography'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Encryption'),
              Tab(text: 'Decryption'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            EncryptionPage(),
            DecryptionPage(),
          ],
        ),
      ),
    );
  }
}
