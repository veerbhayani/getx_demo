import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counterex_controller.dart';

class CounterExUiDemo extends StatelessWidget {
  const CounterExUiDemo({super.key});

  @override
  Widget build(BuildContext context) {
    CounterExContoller counterExContoller = Get.find();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      counterExContoller.count--;
                    },
                    icon: const Icon(Icons.minimize)),
                Obx(() => Text(counterExContoller.count.value.toString())),
                IconButton(
                    onPressed: () {
                      counterExContoller.count++;
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      counterExContoller.doubleCount - 2;
                    },
                    icon: const Icon(Icons.minimize)),
                Obx(() =>
                    Text(counterExContoller.doubleCount.value.toString())),
                IconButton(
                    onPressed: () {
                      counterExContoller.doubleCount + 2;
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
