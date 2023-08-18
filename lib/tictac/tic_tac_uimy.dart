import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/tictac/tic_tac_controller.dart';

class TicTacUiDemo extends StatefulWidget {
  const TicTacUiDemo({super.key});

  @override
  State<TicTacUiDemo> createState() => _TicTacUiDemoState();
}

class _TicTacUiDemoState extends State<TicTacUiDemo> {
  TicTacControllermy ticTacController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'PLAYER 1',
                      style: TextStyle(fontSize: 45, color: Colors.white),
                    ),
                    Text(
                      ticTacController.oScore.value.toString(),
                      style: const TextStyle(fontSize: 45, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'PLAYER 2',
                      style: TextStyle(fontSize: 45, color: Colors.white),
                    ),
                    Text(
                      ticTacController.xScore.value.toString(),
                      style: const TextStyle(fontSize: 45, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5),
              itemBuilder: (context, index) => Obx(
                () => GestureDetector(
                  onTap: () {
                    ticTacController.tapped(index, context);
                  },
                  child: Card(
                    color: ticTacController.cardColor[index],
                    elevation: 2,
                    shape: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    child: Center(
                      child: Text(
                        ticTacController.displayElement[index],
                        style: const TextStyle(
                            fontSize: 80,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  ticTacController.clearScoreBoard();
                },
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 70,
                color: Colors.white,
                child: const Text(
                  'Clear Score Board',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  ticTacController.allClear();
                },
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 70,
                color: Colors.white,
                child: const Text(
                  'Restart',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
