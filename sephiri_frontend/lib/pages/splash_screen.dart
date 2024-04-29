import 'package:flutter/material.dart';

class TypingAnimation extends StatefulWidget {
  @override
  _TypingAnimationState createState() => _TypingAnimationState();
}

class _TypingAnimationState extends State<TypingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  String _word = 'Sephiri Cryptography';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500 * _word.length),
    );

    _animation =
        StepTween(begin: 0, end: _word.length.toInt()).animate(_controller)
          ..addListener(() {
            setState(() {
              _currentIndex = _animation.value.toInt();
            });
          });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Typing Animation'),
      ),
      body: Center(
        child: Text(
          _word.substring(0, _currentIndex),
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
