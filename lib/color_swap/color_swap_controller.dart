import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorSwapController extends GetxController {
  RxBool flag = true.obs;
  RxList<Color> colorList = [
    Colors.red,
    Colors.yellow,
    Colors.black,
    Colors.blue,
    Colors.brown,
    Colors.purple,
    Colors.green,
    Colors.teal,
    Colors.grey
  ].obs;
  RxInt? firstIndex, secoundIndex;

  void colorController(int index) {
    if (firstIndex == null) {
      firstIndex = index.obs;
      print(firstIndex);
    } else {
      secoundIndex = index.obs;
      print(secoundIndex);
    }
    if (firstIndex != null && secoundIndex != null) {
      Color temp = colorList[firstIndex!.value];
      colorList[firstIndex!.value] = colorList[secoundIndex!.value];
      colorList[secoundIndex!.value] = temp;
      firstIndex = null;
      secoundIndex = null;
    }
  }

//////////////////////
  void selectColors(int index) {
    if (flag == true) {
      firstIndex = index.obs;
      flag = false.obs;
    } else {
      secoundIndex = index.obs;
      Color temp = colorList[firstIndex!.value];
      colorList[firstIndex!.value] = colorList[secoundIndex!.value];
      colorList[secoundIndex!.value] = temp;
      flag = true.obs;
    }
  }
}
