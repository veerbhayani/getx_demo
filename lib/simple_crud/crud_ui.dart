import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'crud_controller.dart';

class CrudUi extends StatelessWidget {
  const CrudUi({super.key});

  @override
  Widget build(BuildContext context) {
    CrudController crudController = Get.find();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            TextField(
              controller: crudController.fname.value,
              decoration: const InputDecoration(
                hintText: 'First Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: crudController.mname.value,
              decoration: const InputDecoration(
                hintText: 'Middle Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: crudController.lname.value,
              decoration: const InputDecoration(
                hintText: 'Last Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                crudController.addMethod();
                crudController.clearmethod();
              },
              color: Colors.blue,
              child: const Text('Submit'),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => crudController.myDataList.isEmpty
                  ? const Text('Data not found')
                  : Expanded(
                      child: ListView.builder(
                        itemCount: crudController.myDataList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              crudController.selectedIndex.value = index;
                              log(crudController.selectedIndex.toString());
                              crudController.onTap(index);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    backgroundColor: Colors.white,
                                    contentPadding: const EdgeInsets.all(5),
                                    children: [
                                      TextField(
                                        controller: crudController.uFname.value,
                                        decoration: const InputDecoration(
                                          hintText: 'First Name',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: crudController.uMname.value,
                                        decoration: const InputDecoration(
                                          hintText: 'Middle Name',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: crudController.uLname.value,
                                        decoration: const InputDecoration(
                                          hintText: 'Last Name',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          crudController.myDataList[
                                                  crudController.selectedIndex
                                                      .value]['fname'] =
                                              crudController.uFname.value.text;
                                          crudController.myDataList[
                                                  crudController.selectedIndex
                                                      .value]['mname'] =
                                              crudController.uMname.value.text;
                                          crudController.myDataList[
                                                  crudController.selectedIndex
                                                      .value]['lname'] =
                                              crudController.uLname.value.text;
                                          Navigator.pop(context);

                                          // crudController.uFname.value.clear();
                                          // crudController.uLname.value.clear();
                                          // crudController.uMname.value.clear();
                                        },
                                        color: Colors.blue,
                                        child: const Text('Submit'),
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Fname : ${crudController.myDataList[index]['fname']}'),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    'Mname : ${crudController.myDataList[index]['mname']}'),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    'Lname : ${crudController.myDataList[index]['lname']}'),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
