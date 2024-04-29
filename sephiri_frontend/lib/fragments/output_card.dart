import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class OutputCard extends StatefulWidget {
  final String outputText;

  const OutputCard({super.key, required this.outputText});

  @override
  State<OutputCard> createState() => _OutputCardState();
}

class _OutputCardState extends State<OutputCard> {
  // A function to copy a message to the clipboard
  void copyText(String text) {
    FlutterClipboard.copy(text).then((value) => {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Text copied to clipboard"),
            duration: Duration(seconds: 2),
          ))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Row(
            children: [Text("Output")],
          ),
          Row(
            children: [Text(widget.outputText)],
          ),
          Row(
            children: [
              FilledButton(
                  onPressed: () => copyText(widget.outputText),
                  child: const Text("Copy Text")),
              FilledButton(onPressed: () {}, child: const Text("Write to file"))
            ],
          )
        ],
      ),
    );
  }
}
