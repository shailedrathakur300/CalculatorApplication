import 'package:flutter/material.dart';
import 'calculator_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const CalculatorScreen(),
    );
  }
}
