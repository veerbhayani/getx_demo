import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_swap_controller.dart';

class ColorSwapUiDemo extends StatelessWidget {
  const ColorSwapUiDemo({super.key});

  @override
  Widget build(BuildContext context) {
    ColorSwapController colorSwapController = Get.find();
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                children: List.generate(
                  colorSwapController.colorList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      colorSwapController.colorController(index);
                    },
                    child: Container(
                      color: colorSwapController.colorList[index],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
