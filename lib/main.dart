import 'package:flutter/material.dart';
import 'package:getx_demo/init_controller.dart';
import 'package:getx_demo/simple_crud/crud_ui.dart';

void main() {
  InitController.getAllController;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CrudUi(),
    );
  }
}
