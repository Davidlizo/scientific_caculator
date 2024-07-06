import 'package:flutter/material.dart';

import '../controllers/caculator_controller.dart';
import 'scientific_caculator_button.dart';

class scientificButtonGrid extends StatelessWidget {
  final CalculatorController controller;

  scientificButtonGrid({required this.controller});

  @override
  Widget build(BuildContext context) {
    List<String> buttons = [
      '⏲',
      '↑',
      'C',
      '⌫',
      '⇌',
      'sin',
      'cos',
      'tan',
      'ln',
      '√',
      '(',
      ')',
      '%',
      'π',
      'e',
      '7',
      '8',
      '9',
      '/',
      'xʸ',
      '4',
      '5',
      '6',
      '×',
      'x²',
      '1',
      '2',
      '3',
      '-',
      '+',
      '±',
      '0',
      '.',
      ' .',
      '=',
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
      itemCount: buttons.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _buildCalculatorButton(buttons[index], context);
      },
    );
  }

  Widget _buildCalculatorButton(String label, BuildContext context) {
    if (label == '⏲' || label == '↑' || label == '⇌') {
      // Handle icon buttons
      IconData iconData;
      switch (label) {
        case '⏲':
          iconData = Icons.access_time;
          break;
        case '↑':
          iconData = Icons.arrow_upward;
          break;
        case '⇌':
          iconData = Icons.swap_horiz;
          break;
        default:
          iconData = Icons.ac_unit;
      }

      return IconButton(
        icon: Icon(iconData),
        onPressed: () {},
      );
    } else {
      // To Handle text buttons
      Color buttonColor = _getColorForButton(label);
      if (label == 'C' || label == '⌫') {
        buttonColor = Theme.of(context).scaffoldBackgroundColor;
      }

      return CalculatorButton(
        label: label,
        color: buttonColor,
        hasBottomRightRadius: label == '=',
        onTap: () {
          if (label == '⌫') {
            // To Handle delete button press
            controller.delete();
          } else {
            controller.input(label);
          }
        },
      );
    }
  }

  Color _getColorForButton(String label) {
    switch (label) {
      case 'C':
        return Colors.grey.shade200;
      case '=':
        return Colors.blue;
      default:
        return Colors.grey.shade200;
    }
  }
}
