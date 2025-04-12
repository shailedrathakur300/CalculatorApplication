class CalculatorModel {
  String _currentInput = '';
  String _previousInput = '';
  String _operator = '';
  String _result = '0';
  bool _hasCalculated = false;

  String get expression {
    if (_operator.isEmpty) {
      return _currentInput.isEmpty ? '0' : _currentInput;
    } else {
      return '$_previousInput $_operator${_currentInput.isNotEmpty ? ' $_currentInput' : ''}';
    }
  }

  String get result => _result;
  String get currentInput => _currentInput;
  String get previousInput => _previousInput;
  String get operator => _operator;

  void clear() {
    _currentInput = '';
    _previousInput = '';
    _operator = '';
    _result = '0';
    _hasCalculated = false;
  }

  void addDigit(String digit) {
    if (_hasCalculated) {
      _currentInput = digit;
      _hasCalculated = false;
    } else {
      _currentInput += digit;
    }

    // Format display number
    if (_currentInput.isNotEmpty) {
      double? number = double.tryParse(_currentInput);
      if (number != null) {
        _result = number.toString();
        if (_result.endsWith('.0')) {
          _result = _result.substring(0, _result.length - 2);
        }
      }
    } else {
      _result = '0';
    }
  }

  void addDecimal() {
    if (_hasCalculated) {
      _currentInput = '0.';
      _hasCalculated = false;
    } else if (!_currentInput.contains('.')) {
      _currentInput = _currentInput.isEmpty ? '0.' : '$_currentInput.';
    }
  }

  void setOperator(String op) {
    if (_currentInput.isNotEmpty) {
      if (_previousInput.isNotEmpty && _operator.isNotEmpty) {
        // Chain calculations
        calculateResult();
        _previousInput = _result;
      } else {
        _previousInput = _currentInput;
      }
      _currentInput = '';
    } else if (_previousInput.isEmpty) {
      _previousInput = '0';
    }

    _operator = op;
    _hasCalculated = false;
  }

  void toggleSign() {
    if (_currentInput.isNotEmpty) {
      if (_currentInput.startsWith('-')) {
        _currentInput = _currentInput.substring(1);
      } else {
        _currentInput = '-$_currentInput';
      }

      double? number = double.tryParse(_currentInput);
      if (number != null) {
        _result = number.toString();
        if (_result.endsWith('.0')) {
          _result = _result.substring(0, _result.length - 2);
        }
      }
    } else if (_result != '0') {
      double value = double.parse(_result);
      value = -value;
      _result = value.toString();
      if (_result.endsWith('.0')) {
        _result = _result.substring(0, _result.length - 2);
      }
      _currentInput = _result;
    }
  }

  void calculateResult() {
    if (_previousInput.isEmpty || _operator.isEmpty) return;

    double num1 = double.tryParse(_previousInput) ?? 0;
    double num2 =
        double.tryParse(_currentInput.isEmpty ? "0" : _currentInput) ?? 0;
    double resultValue = 0;

    switch (_operator) {
      case '+':
        resultValue = num1 + num2;
        break;
      case '-':
        resultValue = num1 - num2;
        break;
      case '×':
        resultValue = num1 * num2;
        break;
      case '÷':
        resultValue = num2 != 0 ? num1 / num2 : double.infinity;
        break;
      case '%':
        resultValue = num1 % num2;
        break;
    }

    _result = resultValue.toString();
    if (_result.endsWith('.0')) {
      _result = _result.substring(0, _result.length - 2);
    }

    _hasCalculated = true;
    _currentInput = _result;
    _previousInput = '';
    _operator = '';
  }
}
