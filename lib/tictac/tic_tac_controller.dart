import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicTacControllermy extends GetxController {
  RxBool oTurn = true.obs;
  RxList<String> displayElement = ['', '', '', '', '', '', '', '', ''].obs;
  RxList cardColor = List.generate(9, (index) => Colors.teal).obs;
  RxInt oScore = 0.obs;
  RxInt xScore = 0.obs;
  RxInt filledBoxes = 0.obs;

  void tapped(int index, context) {
    if (oTurn.value && displayElement[index] == '') {
      displayElement[index] = 'O';
      cardColor[index] = Colors.amber;
      filledBoxes++;
    } else if (!oTurn.value && displayElement[index] == '') {
      displayElement[index] = 'X';
      cardColor[index] = Colors.brown;
      filledBoxes++;
    }
    oTurn.value = !oTurn.value;
    checkWinner(context);
  }

  void checkWinner(context) {
    // Checking rows
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != '') {
      showWinDialog(displayElement[0], context);
      clearBoard();
    }
    if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      showWinDialog(displayElement[3], context);
      clearBoard();
    }
    if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      showWinDialog(displayElement[6], context);
      clearBoard();
    }

    // Checking Column
    if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      showWinDialog(displayElement[0], context);
      clearBoard();
    }
    if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      showWinDialog(displayElement[1], context);
      clearBoard();
    }
    if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      showWinDialog(displayElement[2], context);
      clearBoard();
    }

    // Checking Diagonal
    if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      showWinDialog(displayElement[0], context);
      clearBoard();
    }
    if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      showWinDialog(displayElement[2], context);
      clearBoard();
    } else if (filledBoxes == 9) {
      showDrawDialog(context);
      clearBoard();
    }
  }

  void showWinDialog(String winner, context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" $winner \" is Winner!!!"),
            actions: [
              TextButton(
                child: const Text("Play Again"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
  }

  void showDrawDialog(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Draw"),
            actions: [
              TextButton(
                child: const Text("Play Again"),
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void clearBoard() {
    for (int i = 0; i < 9; i++) {
      displayElement[i] = '';
      cardColor[i] = Colors.teal;
    }
    filledBoxes.value = 0;
  }

  void allClear() {
    xScore.value = 0;
    oScore.value = 0;
    for (int i = 0; i < 9; i++) {
      displayElement[i] = '';
      cardColor[i] = Colors.teal;
    }
    filledBoxes.value = 0;
  }

  void clearScoreBoard() {
    xScore.value = 0;
    oScore.value = 0;
    filledBoxes.value = 0;
  }
}
