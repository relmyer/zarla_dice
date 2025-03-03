import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Sigmar',
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Zarla",
            style: TextStyle(
              fontFamily: 'Sigmar',
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;


  void rollLeftDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void rollRightDice() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Şansını dene!",
          style: TextStyle(
            fontFamily: 'Sigmar',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: rollLeftDice,
                child: Image.asset("images/$leftDiceNumber.png"),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: rollRightDice,
                child: Image.asset("images/$rightDiceNumber.png"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
