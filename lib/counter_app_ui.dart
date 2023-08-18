import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/counterapp_controller.dart';

class CounterAppUiDemo extends StatelessWidget {
  const CounterAppUiDemo({super.key});

  @override
  Widget build(BuildContext context) {
    CounterController counterController = Get.find();
    return Scaffold(
      body: Center(
          child: Obx(() => Text(counterController.count.value.toString()))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.count++;
          print(counterController.count);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
