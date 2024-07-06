import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/caculator_controller.dart';
import '../widgets/standard_button_grid.dart';
import 'scientific_caculator_screen.dart';

class StandardCaculatorScreen extends StatelessWidget {
  final CalculatorController controller = Get.put(CalculatorController());
  StandardCaculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALCULATOR'),
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
        
          StandardButtonGrid(controller: controller),
        ],
      ),
    );
  }
}
