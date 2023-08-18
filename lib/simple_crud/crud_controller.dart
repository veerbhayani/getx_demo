import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CrudController extends GetxController {
  final fname = TextEditingController().obs;
  final mname = TextEditingController().obs;
  final lname = TextEditingController().obs;
  final uFname = TextEditingController().obs;
  final uMname = TextEditingController().obs;
  final uLname = TextEditingController().obs;
  //RxList<Rx<Map<String, dynamic>>> userData = <Rx<Map<String, dynamic>>>[].obs;
  RxList<Map<String, dynamic>> myDataList = <Map<String, dynamic>>[].obs;
  RxInt selectedIndex = 0.obs;
  RxBool isUpdate = false.obs;

  void addMethod() {
    myDataList.add({
      'fname': fname.value.text,
      'mname': mname.value.text,
      'lname': lname.value.text,
    });
  }

  void clearmethod() {
    fname.value.clear();
    lname.value.clear();
    mname.value.clear();
  }

  void onTap(dynamic index) {
    uFname.value.text = myDataList[index]['fname'];
    uMname.value.text = myDataList[index]['mname'];
    uLname.value.text = myDataList[index]['lname'];
  }
}
