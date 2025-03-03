import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
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
  int rollCount = 0;
  int textIndex = 0;

  //çok komiğimdir
  final List<String> funnyTexts = [
    "Bu kadar yuvarlandım ama hala ekmeğimi taştan çıkaramadım.",
    "Roll dedik de, çeyrek altın roll-on gibi oldu...",
    "Yuvarlanıyorum ama tekerlek değilim, bu nasıl hayat?",
    "Düşe kalka gidiyoruz ama hala yol yapıyorlar...",
    "Bu hayat bana 'roll' biçmiş ama ben simit olmayı tercih ediyorum.",
    "Yuvarlanıyoruz ama düz yol yok.",
    "Roll dedik, yine simit fiyatı aklıma geldi.",
    "Kader zar attı, yine düşeş değil, düşüş geldi.",
    "Tekerlek değilim ama hep bir yerlere savruluyorum.",
    "Yuvarlanıyoruz işte, ama dik duranı seviyor bu hayat.",
    "Düşe kalka büyüyoruz, ama daha çok düşüyoruz."
  ];

  int getRandomDiceNumber() {
    return Random().nextInt(6) + 1;
  }


  void rollDice() {
    setState(() {
      leftDiceNumber = getRandomDiceNumber();
      rightDiceNumber = getRandomDiceNumber();
      rollCount++;

      if (rollCount % 2 == 0) {
        textIndex = (textIndex + 1) % funnyTexts.length;
      }
    });
  }


  void rollLeftDice() {
    setState(() {
      leftDiceNumber = getRandomDiceNumber();
      rollCount++;

      if (rollCount % 2 == 0) {
        textIndex = (textIndex + 1) % funnyTexts.length;
      }
    });
  }


  void rollRightDice() {
    setState(() {
      rightDiceNumber = getRandomDiceNumber();
      rollCount++;

      if (rollCount % 2 == 0) {
        textIndex = (textIndex + 1) % funnyTexts.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          funnyTexts[textIndex],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Sigmar',
            fontSize: 18,
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
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: rollDice,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFC62828),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          child: const Text("Zarları At!"),
        ),
      ],
    );
  }
}
