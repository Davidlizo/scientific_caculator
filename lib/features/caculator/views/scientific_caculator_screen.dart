import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/caculator_controller.dart';
import '../widgets/scientific_button_grid.dart';
import 'standard_caculator_screen.dart';

class ScientificCalculatorScreen extends StatelessWidget {
  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SCIENTIFIC'),
        actions: [
          IconButton(
            icon: Icon(Icons.dark_mode_outlined),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Calculator Menu'),
            ),
            ListTile(
              title: Text('Scientific'),
              onTap: () {
                Get.off(ScientificCalculatorScreen());
                },
            ),
            ListTile(
              title: Text('Standard'),
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
              padding: EdgeInsets.all(16),
              child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    controller.display.value,
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    controller.result.value,
                    style: TextStyle(fontSize: 48),
                  ),
                ],
              )),
            ),
          ),
        
          scientificButtonGrid(controller: controller),
        ],
      ),
    );
  }
}
