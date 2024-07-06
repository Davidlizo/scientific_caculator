import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;
  final bool hasBottomRightRadius;

  const CalculatorButton({super.key, 
    required this.label,
    required this.color,
    required this.onTap,
    this.hasBottomRightRadius = false,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white;
    
    // Set text color based on label and button color
    if (label == 'C') {
      textColor = Colors.red;
    } else if (label == '⌫') {
      textColor = Colors.black;
    } else if (color == Colors.grey[200]) {
      textColor = Colors.black;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            bottomRight: hasBottomRightRadius ? const Radius.circular(5.0) : Radius.zero,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 27,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
