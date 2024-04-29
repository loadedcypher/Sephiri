import 'package:flutter/material.dart';

class OutputCard extends StatefulWidget {
  final String outputText;

  const OutputCard({super.key, required this.outputText});

  @override
  State<OutputCard> createState() => _OutputCardState();
}

class _OutputCardState extends State<OutputCard> {
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
              FilledButton(onPressed: () {}, child: const Text("Copy Text")),
              FilledButton(onPressed: () {}, child: const Text("Write to file"))
            ],
          )
        ],
      ),
    );
  }
}
