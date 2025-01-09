import 'package:flutter/material.dart';
import 'interactive_board.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: InteractiveBoard(),
        ),
      ),
    );
  }
}
