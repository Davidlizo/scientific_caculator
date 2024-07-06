import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;

class CalculatorController extends GetxController {
  var display = ''.obs;
  var result = '0'.obs;

  void input(String value) {
    if (value == 'C') {
      display.value = '';
      result.value = '0';
    } else if (value == '=') {
      calculate();
    } else if (['sin', 'cos', 'tan', 'ln', '√'].contains(value)) {
      display.value += '$value(';
    } else if (value == 'π') {
      display.value += '3.142'; // Approximation of pi
    } else if (value == 'e') {
      display.value += '2.718'; // Approximation of e
    } else if (value == 'xʸ') {
      display.value += '^';
    } else if (value == 'x²') {
      display.value += '^2';
    } else if (value == '±') {
      toggleSign();
    } else if (value == '×') {
      display.value += '*'; // Ensure input processing handles '×' as '*'
    } else if (value == '%') {
      display.value += '/100';
    } else {
      display.value += value;
    }
  }

  void delete() {
    if (display.value.isNotEmpty) {
      display.value = display.value.substring(0, display.value.length - 1);
    }
  }

  void toggleSign() {
    if (display.value.isEmpty) return;

    if (display.value.startsWith('-')) {
      display.value = display.value.substring(1);
    } else {
      display.value = '-${display.value}';
    }
  }

  void calculate() {
    try {
      Parser p = Parser();
      String expression = _prepareExpression(display.value);
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('pi'), Number(math.pi));
      cm.bindVariable(Variable('e'), Number(math.e));
      double evalResult = exp.evaluate(EvaluationType.REAL, cm);

      // Check for special cases
      if (evalResult.isNaN || evalResult.isInfinite) {
        result.value = 'Error';
      } else {
        result.value = evalResult.toStringAsFixed(8);
      }
    } catch (e) {
      result.value = 'Error';
    }
  }

  String _prepareExpression(String expr) {
    expr = expr.replaceAll('√', 'sqrt');

    // Handle trigonometric functions
    RegExp regExp = RegExp(r'(sin|cos|tan)\((.*?)\)');
    expr = expr.replaceAllMapped(regExp, (Match m) {
      String func = m.group(1)!;
      String arg = m.group(2)!;
      return '$func($arg)';
    });

    // Handle natural logarithm
    expr = expr.replaceAll('ln(', 'log(');
    expr = expr.replaceAll('log(', '1/ln(10)*ln(');

    // Handle x²
    expr = expr.replaceAll('x²', '^2');

    return expr;
  }
}
