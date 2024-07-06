import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/caculator_controller.dart';
import '../widgets/scientific_button_grid.dart';
import 'standard_caculator_screen.dart';

class ScientificCalculatorScreen extends StatelessWidget {
  final CalculatorController controller = Get.put(CalculatorController());
  ScientificCalculatorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SCIENTIFIC'),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode_outlined),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
           const DrawerHeader(
              child: Text('Calculator Menu'),
            ),
            ListTile(
              title: const Text('Scientific'),
              onTap: () {
                Get.off(ScientificCalculatorScreen());
                },
            ),
            ListTile(
              title: const Text('Standard'),
              onTap: () {
                Get.off(StandardCaculatorScreen());
                },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(16),
              child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    controller.display.value,
                    style: const TextStyle(fontSize: 32),
                  ),
                  Text(
                    controller.result.value,
                    style: const TextStyle(fontSize: 48),
                  ),
                ],
              )),
            ),
          ),
        
          ScientificButtonGrid(controller: controller),
        ],
      ),
    );
  }
}
