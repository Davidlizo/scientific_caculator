import 'package:flutter/material.dart';

import '../controllers/caculator_controller.dart';
import 'scientific_caculator_button.dart';

class NormalButtonGrid extends StatelessWidget {
  final CalculatorController controller;

  const NormalButtonGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    List<String> buttons = [
      '⏲',
      'C',
      '⌫',
      '⇌',
      '√',
      '(',
      ')',
      '%',
      '7',
      '8',
      '9',
      '/',
      '4',
      '5',
      '6',
      '×',
      '1',
      '2',
      '3',
      '-',
      '0',
      '.',
      '+',
      '=',
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: buttons.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _buildCalculatorButton(buttons[index], context);
      },
    );
  }

  Widget _buildCalculatorButton(String label, BuildContext context) {
    if (label == '⏲' || label == '⇌') {
      // Handle icon buttons
      IconData iconData;
      switch (label) {
        case '⏲':
          iconData = Icons.access_time;
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