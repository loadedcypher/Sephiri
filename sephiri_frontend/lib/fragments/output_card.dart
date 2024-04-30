import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:sephiri_frontend/functions/utils.dart';
import 'package:file_picker/file_picker.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Row(
              children: [Text("Output")],
            ),
            Row(
              children: [Text(widget.outputText)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FilledButton(
                      onPressed: () => copyText(widget.outputText),
                      child: const Text("Copy Text")),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FilledButton(
                      onPressed: () async {
                        String? result =
                            await FilePicker.platform.getDirectoryPath();
                        writeFile(result!, 'encrypted${DateTime.now()}.txt',
                                widget.outputText)
                            .then((value) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("File has been saved"),
                            duration: Duration(seconds: 2),
                          ));
                        });
                      },
                      child: const Text("Write to file")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
