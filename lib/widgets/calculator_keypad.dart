// widgets/calculator_keypad.dart
import 'package:flutter/material.dart';
import 'calculator_button.dart';

class CalculatorKeypad extends StatelessWidget {
  final Function(String) onKeyPressed;

  const CalculatorKeypad({
    super.key,
    required this.onKeyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              CalculatorButton(
                text: 'C',
                backgroundColor: Colors.redAccent,
                textColor: Colors.white,
                onPressed: () => onKeyPressed('C'),
              ),
              CalculatorButton(
                text: '()',
                textColor: Colors.green,
                onPressed: () {},
              ),
              CalculatorButton(
                text: '%',
                textColor: Colors.green,
                onPressed: () => onKeyPressed('%'),
              ),
              CalculatorButton(
                text: '÷',
                textColor: Colors.green,
                onPressed: () => onKeyPressed('÷'),
              ),
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                text: '7',
                onPressed: () => onKeyPressed('7'),
              ),
              CalculatorButton(
                text: '8',
                onPressed: () => onKeyPressed('8'),
              ),
              CalculatorButton(
                text: '9',
                onPressed: () => onKeyPressed('9'),
              ),
              CalculatorButton(
                text: '×',
                textColor: Colors.green,
                onPressed: () => onKeyPressed('×'),
              ),
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                text: '4',
                onPressed: () => onKeyPressed('4'),
              ),
              CalculatorButton(
                text: '5',
                onPressed: () => onKeyPressed('5'),
              ),
              CalculatorButton(
                text: '6',
                onPressed: () => onKeyPressed('6'),
              ),
              CalculatorButton(
                text: '-',
                textColor: Colors.green,
                onPressed: () => onKeyPressed('-'),
              ),
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                text: '1',
                onPressed: () => onKeyPressed('1'),
              ),
              CalculatorButton(
                text: '2',
                onPressed: () => onKeyPressed('2'),
              ),
              CalculatorButton(
                text: '3',
                onPressed: () => onKeyPressed('3'),
              ),
              CalculatorButton(
                text: '+',
                textColor: Colors.green,
                onPressed: () => onKeyPressed('+'),
              ),
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                text: '+/-',
                onPressed: () => onKeyPressed('+/-'),
              ),
              CalculatorButton(
                text: '0',
                onPressed: () => onKeyPressed('0'),
              ),
              CalculatorButton(
                text: '.',
                onPressed: () => onKeyPressed('.'),
              ),
              CalculatorButton(
                text: '=',
                backgroundColor: Colors.green,
                textColor: Colors.white,
                onPressed: () => onKeyPressed('='),
              ),
            ],
          ),
        ],
      ),
    );
  }
}