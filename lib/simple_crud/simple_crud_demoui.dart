import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/simple_crud/simple_crud_controller.dart';

class SimpleCrudeDemoUi extends StatelessWidget {
  const SimpleCrudeDemoUi({super.key});

  @override
  Widget build(BuildContext context) {
    SimpleCrudContoller simpleCrudContoller = Get.find();
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: simpleCrudContoller.txtNameEditingController.value,
          ),
          TextField(
            controller: simpleCrudContoller.txtSurNameEditingController.value,
          ),
          Row(
            children: [
              const Text('Gender : '),
              const Text('Male'),
              Obx(
                () => Radio(
                  value: simpleCrudContoller.male.value,
                  groupValue: simpleCrudContoller.gender.value,
                  onChanged: (value) {
                    simpleCrudContoller.genderMethod(value!);
                  },
                ),
              ),
              const Text('FeMale'),
              Obx(
                () => Radio(
                  value: simpleCrudContoller.feMale.value,
                  groupValue: simpleCrudContoller.gender.value,
                  onChanged: (value) {
                    simpleCrudContoller.genderMethod(value!);
                  },
                ),
              ),
            ],
          ),

          Row(
            children: [
              const Text('Hobby : '),
              const Text('Cricket'),
              Obx(
                () => Checkbox(
                  value: simpleCrudContoller.isCricket.value,
                  onChanged: (value) {
                    simpleCrudContoller.cricketMethod(value!);
                  },
                ),
              ),
              const Text('Football'),
              Obx(
                () => Checkbox(
                  value: simpleCrudContoller.isFootball.value,
                  onChanged: (value) {
                    simpleCrudContoller.footballMethod(value!);
                  },
                ),
              ),
              const Text('Singing'),
              Obx(
                () => Checkbox(
                  value: simpleCrudContoller.isSinging.value,
                  onChanged: (value) {
                    simpleCrudContoller.singingMethod(value!);
                  },
                ),
              ),
            ],
          ),
          Obx(
            () => Slider(
              value: simpleCrudContoller.selectedAge.value,
              onChanged: (value) {
                simpleCrudContoller.ageMethod(value);
              },
              min: 0,
              max: 100,
            ),
          ),
          // Obx(() => DropdownButton(
          //       items: simpleCrudContoller.stream
          //           .map((e) => DropdownMenuItem(
          //                 value: e,
          //                 child: Text(e),
          //               ))
          //           .toList(),
          //       onChanged: (value) {
          //         simpleCrudContoller.streamMethod(value as String);
          //       },
          //     )),
          MaterialButton(
            onPressed: () {
              simpleCrudContoller.addUserData();
              simpleCrudContoller.clearMethod();
            },
            child: const Text('Submit'),
          ),
          Obx(
            () => simpleCrudContoller.userData.isEmpty
                ? const Text('There is not data')
                : Expanded(
                    child: ListView.builder(
                      itemCount: simpleCrudContoller.userData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            simpleCrudContoller.selectedIndex.value = index;
                            simpleCrudContoller.onTapUpdate();
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                  title: Column(
                                    children: [
                                      TextField(
                                        controller: simpleCrudContoller
                                            .txtUpdateNameEditingController
                                            .value,
                                      ),
                                      TextField(
                                        controller: simpleCrudContoller
                                            .txtUpdateSurNameEditingController
                                            .value,
                                      ),
                                      Obx(
                                        () => Row(
                                          children: [
                                            const Text('Gender : '),
                                            const Text('Male'),
                                            Radio(
                                              value: simpleCrudContoller
                                                  .maleUpdate.value,
                                              groupValue: simpleCrudContoller
                                                  .genderUpdate.value,
                                              onChanged: (value) {
                                                simpleCrudContoller
                                                    .genderMethod(value!);
                                              },
                                            ),
                                            const Text('FeMale'),
                                            Radio(
                                              value: simpleCrudContoller
                                                  .feMaleUpdate.value,
                                              groupValue: simpleCrudContoller
                                                  .genderUpdate.value,
                                              onChanged: (value) {
                                                simpleCrudContoller
                                                    .genderMethod(value!);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Text('Hobby : '),
                                          const Text('Cricket'),
                                          Obx(
                                            () => Checkbox(
                                              value: simpleCrudContoller
                                                  .isCricketUpdate.value,
                                              onChanged: (value) {
                                                simpleCrudContoller
                                                    .cricketUpdateMethod(
                                                        value!);
                                              },
                                            ),
                                          ),
                                          const Text('Football'),
                                          Obx(
                                            () => Checkbox(
                                              value: simpleCrudContoller
                                                  .isFootballUpdate.value,
                                              onChanged: (value) {
                                                simpleCrudContoller
                                                    .footballUpdateMethod(
                                                        value!);
                                              },
                                            ),
                                          ),
                                          const Text('Singing'),
                                          Obx(
                                            () => Checkbox(
                                              value: simpleCrudContoller
                                                  .isSingingUpdate.value,
                                              onChanged: (value) {
                                                simpleCrudContoller
                                                    .singingUpdateMethod(
                                                        value!);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      Obx(
                                        () => Slider(
                                          value: simpleCrudContoller
                                              .selectedAgeUpdate.value,
                                          onChanged: (value) {
                                            simpleCrudContoller
                                                .ageUpdateMethod(value);
                                          },
                                          min: 0,
                                          max: 100,
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        simpleCrudContoller.updateMethod();
                                        simpleCrudContoller
                                            .updateButton(context);
                                      },
                                      child: const Text('update'),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        simpleCrudContoller
                                            .cancleButton(context);
                                      },
                                      child: const Text('cancle'),
                                    )
                                  ]),
                            );
                          },
                          child: Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                    title: const Text('Are you sure?'),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () {
                                          simpleCrudContoller.deleteButton(
                                              context, index);
                                        },
                                        child: const Text('delete'),
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          simpleCrudContoller
                                              .cancleDeleteButton(context);
                                        },
                                        child: const Text('cancle'),
                                      )
                                    ]),
                              );
                            },
                            child: Container(
                              height: 120,
                              width: 200,
                              color: Colors.amber,
                              child: Column(
                                children: [
                                  Text(
                                      ' Name :${simpleCrudContoller.userData[index]['name']}'),
                                  Text(
                                      ' SurName :${simpleCrudContoller.userData[index]['surName']}'),
                                  Text(
                                      ' Gender :${simpleCrudContoller.userData[index]['gender']}'),
                                  Text(
                                      ' Hobby :${simpleCrudContoller.userData[index]['hobby']}'),
                                  Text(
                                      ' Age :${simpleCrudContoller.userData[index]['age']}'),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
