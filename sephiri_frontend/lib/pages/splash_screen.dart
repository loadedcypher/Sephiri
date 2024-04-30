import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  final String _word = 'Sephiri Cryptography';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200 * _word.length),
    );
    _animation =
        StepTween(begin: 0, end: _word.length.toInt()).animate(_controller)
          ..addListener(() {
            setState(() {
              _currentIndex = _animation.value.toInt();
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              // Navigate to the home screen after the animation is completed
              Navigator.pushReplacementNamed(context, '/home');
            }
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
      body: Center(
        child: Text(
          _word.substring(0, _currentIndex),
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
