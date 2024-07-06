import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/caculator/views/scientific_caculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScientificCalculatorScreen(),
    );
  }
}
