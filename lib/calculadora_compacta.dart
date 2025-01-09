import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculadoraCompacta extends StatefulWidget {
  const CalculadoraCompacta({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculadoraCompactaState createState() => _CalculadoraCompactaState();
}

class _CalculadoraCompactaState extends State<CalculadoraCompacta> {
  String display = '0';

  void pressionarBotao(String texto) {
    setState(() {
      if (display == '0') {
        display = texto;
      } else {
        display += texto;
      }
    });
  }

  void limparDisplay() {
    setState(() {
      display = '0';
    });
  }

  void calcularResultado() {
    Parser p = Parser();
    ContextModel cm = ContextModel();
    try {
      Expression exp = p.parse(display);
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        display = eval.toString();
      });
    } catch (e) {
      setState(() {
        display = 'Erro';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Text(
            display,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            BotaoCalculadora(texto: '7', aoPressionar: () => pressionarBotao('7')),
            BotaoCalculadora(texto: '8', aoPressionar: () => pressionarBotao('8')),
            BotaoCalculadora(texto: '9', aoPressionar: () => pressionarBotao('9')),
            BotaoCalculadora(texto: '/', aoPressionar: () => pressionarBotao('/')),
            BotaoCalculadora(texto: '4', aoPressionar: () => pressionarBotao('4')),
            BotaoCalculadora(texto: '5', aoPressionar: () => pressionarBotao('5')),
            BotaoCalculadora(texto: '6', aoPressionar: () => pressionarBotao('6')),
            BotaoCalculadora(texto: '*', aoPressionar: () => pressionarBotao('*')),
            BotaoCalculadora(texto: '1', aoPressionar: () => pressionarBotao('1')),
            BotaoCalculadora(texto: '2', aoPressionar: () => pressionarBotao('2')),
            BotaoCalculadora(texto: '3', aoPressionar: () => pressionarBotao('3')),
            BotaoCalculadora(texto: '-', aoPressionar: () => pressionarBotao('-')),
            BotaoCalculadora(texto: '0', aoPressionar: () => pressionarBotao('0')),
            BotaoCalculadora(texto: 'C', aoPressionar: limparDisplay),
            BotaoCalculadora(texto: '=', aoPressionar: calcularResultado),
            BotaoCalculadora(texto: '+', aoPressionar: () => pressionarBotao('+')),
          ],
        ),
      ],
    );
  }
}

class BotaoCalculadora extends StatelessWidget {
  final String texto;
  final Function aoPressionar;

  const BotaoCalculadora({super.key, required this.texto, required this.aoPressionar});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => aoPressionar(),
      child: Text(texto, style: const TextStyle(fontSize: 24)),
    );
  }
}
