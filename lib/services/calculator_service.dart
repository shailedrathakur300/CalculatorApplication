// services/calculator_service.dart
import '../models/calculator_model.dart';

// Interface following Interface Segregation Principle
abstract class ICalculatorService {
  void calculate(CalculatorModel model);
}

// Implementation following Single Responsibility Principle
class CalculatorService implements ICalculatorService {
  @override
  void calculate(CalculatorModel model) {
    model.calculateResult();
  }
}
