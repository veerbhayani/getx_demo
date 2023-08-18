import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/tictac/tic_tic_controller.dart';

class TicTacUi extends StatelessWidget {
  const TicTacUi({super.key});

  @override
  Widget build(BuildContext context) {
    TicTacController tictacController = Get.find();
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text('Player1(O)'),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() => Text(tictacController.player1.value.toString()))
                ],
              ),
              Column(
                children: [
                  const Text('Player2(X)'),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() => Text(tictacController.player2.value.toString()))
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Obx(
              () => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      tictacController.selectedIndex = index.obs;
                      tictacController.play();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            spreadRadius: 3,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        tictacController.gamePlay[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: tictacController.gamePlay.length,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  tictacController.clear();
                },
                child: const Text('Reset'),
              ),
              MaterialButton(
                onPressed: () {
                  tictacController.reserAll();
                },
                child: const Text('Restart'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
