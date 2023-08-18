import 'dart:developer';

import 'package:get/get.dart';

class TicTacController extends GetxController {
  RxInt player1 = 0.obs;
  RxInt player2 = 0.obs;
  RxInt count = 0.obs;
  RxBool changeTurn = false.obs;
  RxList<String> gamePlay = ['', '', '', '', '', '', '', '', ''].obs;
  RxString cross = 'X'.obs;
  RxString zero = 'O'.obs;
  RxInt? selectedIndex;

  void play() {
    if (changeTurn.value == false) {
      if (gamePlay[selectedIndex!.value] == '') {
        gamePlay[selectedIndex!.value] = cross.value;
        count.value++;
        changeTurn = true.obs;
      }
    }
    if (changeTurn.value == true) {
      if (gamePlay[selectedIndex!.value] == '') {
        gamePlay[selectedIndex!.value] = zero.value;
        count.value++;
        changeTurn = false.obs;
      }
    }
    if (count.value == 9) {
      clear();
    }
    if (gamePlay[0] == cross.value &&
        gamePlay[1] == cross.value &&
        gamePlay[2] == cross.value) {
      player1++;
      clear();
    }
    if (gamePlay[3] == cross.value &&
        gamePlay[4] == cross.value &&
        gamePlay[5] == cross.value) {
      player1++;
      clear();
    }
    if (gamePlay[6] == cross.value &&
        gamePlay[7] == cross.value &&
        gamePlay[8] == cross.value) {
      player1++;
      clear();
    }
    if (gamePlay[0] == cross.value &&
        gamePlay[3] == cross.value &&
        gamePlay[6] == cross.value) {
      player1++;
      clear();
    }
    if (gamePlay[1] == cross.value &&
        gamePlay[4] == cross.value &&
        gamePlay[7] == cross.value) {
      player1++;
      clear();
    }
    if (gamePlay[2] == cross.value &&
        gamePlay[5] == cross.value &&
        gamePlay[8] == cross.value) {
      player1++;
      clear();
    }
    if (gamePlay[0] == cross.value &&
        gamePlay[4] == cross.value &&
        gamePlay[8] == cross.value) {
      player1++;
      clear();
    }
    if (gamePlay[2] == cross.value &&
        gamePlay[4] == cross.value &&
        gamePlay[6] == cross.value) {
      player1++;
      clear();
    }

    if (gamePlay[0] == zero.value &&
        gamePlay[1] == zero.value &&
        gamePlay[2] == zero.value) {
      player2++;
      clear();
    }
    if (gamePlay[3] == zero.value &&
        gamePlay[4] == zero.value &&
        gamePlay[5] == zero.value) {
      player2++;
      clear();
    }
    if (gamePlay[6] == zero.value &&
        gamePlay[7] == zero.value &&
        gamePlay[8] == zero.value) {
      player2++;
      clear();
    }
    if (gamePlay[0] == zero.value &&
        gamePlay[3] == zero.value &&
        gamePlay[6] == zero.value) {
      player2++;
      clear();
    }
    if (gamePlay[1] == zero.value &&
        gamePlay[4] == zero.value &&
        gamePlay[7] == zero.value) {
      player2++;
      clear();
    }
    if (gamePlay[2] == zero.value &&
        gamePlay[5] == zero.value &&
        gamePlay[8] == zero.value) {
      player2++;
      clear();
    }
    if (gamePlay[0] == zero.value &&
        gamePlay[4] == zero.value &&
        gamePlay[8] == zero.value) {
      player2++;
      clear();
    }
    if (gamePlay[2] == zero.value &&
        gamePlay[4] == zero.value &&
        gamePlay[6] == zero.value) {
      player2++;
      clear();
    }

    log(count.toString());
  }

  void clear() {
    changeTurn = false.obs;
    gamePlay[0] = '';
    gamePlay[1] = '';
    gamePlay[2] = '';
    gamePlay[3] = '';
    gamePlay[4] = '';
    gamePlay[5] = '';
    gamePlay[6] = '';
    gamePlay[7] = '';
    gamePlay[8] = '';
    count = 0.obs;
  }

  void reserAll() {
    player1.value = 0;
    player2.value = 0;
    clear();
    changeTurn.value = false;
  }
}
