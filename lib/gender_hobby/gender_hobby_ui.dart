import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'gender_hobby_controller.dart';

// ignore: must_be_immutable
class GenderHobbyUiDemo extends StatelessWidget {
  GenderHobbyUiDemo({super.key});
  UiController uiController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Text('Gender: '),
              Obx(
                () => Radio(
                  value: uiController.male.value,
                  groupValue: uiController.gender.value,
                  onChanged: (value) {
                    uiController.changeGender(value.toString());
                    log(uiController.gender.value);
                  },
                ),
              ),
              const Text('Male'),
              Obx(
                () => Radio(
                  value: uiController.female.value,
                  groupValue: uiController.gender.value,
                  onChanged: (value) {
                    uiController.changeGender(value.toString());
                    log(uiController.gender.value);
                  },
                ),
              ),
              const Text('Female'),
            ],
          ),
          Row(
            children: [
              const Text('Hobby: '),
              Obx(
                () => Checkbox(
                  value: uiController.checkBoxValue[0],
                  onChanged: (value) {
                    uiController.changeHobby(0, value!);
                    log(uiController.checkBoxValue.string);
                  },
                ),
              ),
              const Text('Reading'),
              Obx(
                () => Checkbox(
                  value: uiController.checkBoxValue[1],
                  onChanged: (value) {
                    uiController.changeHobby(1, value!);
                    log(uiController.checkBoxValue.string);
                  },
                ),
              ),
              const Text('Football'),
              Obx(
                () => Checkbox(
                  value: uiController.checkBoxValue[2],
                  onChanged: (value) {
                    uiController.changeHobby(2, value!);
                    log(uiController.checkBoxValue.string);
                  },
                ),
              ),
              const Text('Music'),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              uiController.isPressed.value = true;
            },
            child: const Text('Submit'),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => Text(
              uiController.isPressed.value == true
                  ? '${uiController.gender.value} \n ${uiController.checkBoxValue.string}'
                  : 'Value Not Found',
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.to(const CounterAppUi());
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
