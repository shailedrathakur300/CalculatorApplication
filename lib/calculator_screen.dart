
import 'package:flutter/material.dart';
import 'models/calculator_model.dart';
import 'widgets/calculator_display.dart';
import 'widgets/calculator_keypad.dart';
import 'services/calculator_service.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorModel _calculatorModel = CalculatorModel();
  late final ICalculatorService _calculatorService;

  @override
  void initState() {
    super.initState();
    _calculatorService = CalculatorService();
  }

  void _handleKeyPress(String key) {
    setState(() {
      switch (key) {
        case 'C':
          _calculatorModel.clear();
          break;
        case '=':
          _calculatorService.calculate(_calculatorModel);
          break;
        case '+/-':
          _calculatorModel.toggleSign();
          break;
        case '+':
        case '-':
        case '×':
        case '÷':
        case '%':
          _calculatorModel.setOperator(key);
          break;
        case '.':
          _calculatorModel.addDecimal();
          break;
        default:
          _calculatorModel.addDigit(key);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top status bar with icons
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time, color: Colors.black54, size: 20),
                  const SizedBox(width: 20),
                  Icon(Icons.calendar_month, color: Colors.black54, size: 20),
                  const SizedBox(width: 20),
                  Icon(Icons.check_box, color: Colors.black54, size: 20),
                  const SizedBox(width: 20),
                  Icon(Icons.filter_center_focus, color: Colors.black54, size: 20),
                ],
              ),
            ),
            const Divider(height: 1),
            
            // Calculator display
            Expanded(
              child: CalculatorDisplay(
                expression: _calculatorModel.expression,
                result: _calculatorModel.result,
              ),
            ),
            
            // Calculator keypad
            CalculatorKeypad(onKeyPressed: _handleKeyPress),
          ],
        ),
      ),
    );
  }
}