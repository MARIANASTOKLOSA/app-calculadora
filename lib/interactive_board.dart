import 'package:flutter/material.dart';
import 'calculadora_compacta.dart';

class InteractiveBoard extends StatelessWidget {
  const InteractiveBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 193, 193, 193),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const CalculadoraCompacta(),
      ),
    );
  }
}
