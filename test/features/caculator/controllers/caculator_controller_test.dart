import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:scientific_caculator/features/caculator/controllers/caculator_controller.dart';

void main() {
  group('CalculatorController Tests', () {
    late CalculatorController controller;

    setUp(() {
      controller = CalculatorController();
      Get.put(controller);
    });

    tearDown(() {
      Get.reset();
    });

    void expectResult(dynamic expected) {
      if (controller.result.value.isEmpty) {
        fail('Result is empty');
      } else if (controller.result.value == 'Error') {
        expect(controller.result.value, 'Error');
      } else {
        double? parsedResult = double.tryParse(controller.result.value);
        if (parsedResult == null) {
          fail('Result "${controller.result.value}" is not a valid number');
        }
        expect(parsedResult, expected);
      }
    }

    test('Initial state', () {
      expect(controller.display.value, '');
      expect(controller.result.value, '0');
    });

    test('Input and display', () {
      controller.input('5');
      expect(controller.display.value, '5');
    });

    test('Clear input', () {
      controller.input('5');
      controller.input('C');
      expect(controller.display.value, '');
      expect(controller.result.value, '0');
    });

    test('Basic arithmetic', () {
      controller.input('5');
      controller.input('+');
      controller.input('3');
      controller.input('=');
      expectResult(closeTo(8.0, 1e-8));
    });

    test('Trigonometric function - sin', () {
      controller.input('sin');
      controller.input('(');
      controller.input('0');
      controller.input(')');
      controller.input('=');
      expectResult(closeTo(0.0, 1e-8));
    });

    test('Natural logarithm', () {
      controller.input('ln');
      controller.input('(');
      controller.input('1');
      controller.input(')');
      controller.input('=');
      expectResult(closeTo(0.0, 1e-8));
    });

    test('Square root', () {
      controller.input('√');
      controller.input('(');
      controller.input('16');
      controller.input(')');
      controller.input('=');
      expectResult(closeTo(4.0, 1e-8));
    });

    test('Pi constant', () {
      controller.input('π');
      expect(controller.display.value, '3.142');
    });

    test('Euler\'s number', () {
      controller.input('e');
      expect(controller.display.value, '2.718');
    });

    test('Power function', () {
      controller.input('2');
      controller.input('xʸ');
      controller.input('3');
      controller.input('=');
      expectResult(closeTo(8.0, 1e-8));
    });

    test('Complex expression', () {
      controller.input('(');
      controller.input('5');
      controller.input('+');
      controller.input('3');
      controller.input(')');
      controller.input('*');
      controller.input('sin');
      controller.input('(');
      controller.input('π');
      controller.input(')');
      controller.input('=');
      expectResult(closeTo(0.0, 1e-8));
    });

    test('Square operation', () {
      controller.input('2');
      controller.input('x²');
      controller.input('=');
      expectResult(closeTo(4.0, 1e-8));
    });
    test('Calculating percentage', () {
      controller.input('100');
      controller.input('%');
      controller.input('=');
      expectResult(closeTo(1.0, 1e-8));
    });

    test('Error handling - division by zero', () {
      controller.input('1');
      controller.input('/');
      controller.input('0');
      controller.input('=');
      expect(controller.result.value, 'Error');
    });
  });
}
