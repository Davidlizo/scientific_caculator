import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/caculator_controller.dart';
import '../widgets/standard_button_grid.dart';
import 'scientific_caculator_screen.dart';

class StandardCaculatorScreen extends StatelessWidget {
  final CalculatorController controller = Get.put(CalculatorController());
  const StandardCaculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULATOR'),
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
        
          StandardButtonGrid(controller: controller),
        ],
      ),
    );
  }
}
