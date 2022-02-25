/*
 * Project: dicee-flutter
 * File Created: Tuesday, 22nd February 2022 4:56:03 pm
 * Author: Murat Gültürk m.gueltuerk@gmx.de, https://github.com/mgueltuerk
 * Last Modified: Friday, 25th February 2022 9:22:37 am
 * Copyright - 2022, Murat Gültürk
 * Published under GNU Public License (GPL)
 */
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pinkAccent,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.pinkAccent,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  String l = "One", r = "One";
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void updateDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  String showNumber(int num) {
    switch (num) {
      case 1:
        return "One";
      case 2:
        return "Two";
      case 3:
        return "Three";
      case 4:
        return "Four";
      case 5:
        return "Five";
      case 6:
        return "Six";
      default:
        return "One";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                updateDice();
                l = showNumber(leftDiceNumber);
                r = showNumber(rightDiceNumber);
              },
              child: Image.asset(
                "images/dice$leftDiceNumber.png",
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                updateDice();
                l = showNumber(leftDiceNumber);
                r = showNumber(rightDiceNumber);
              },
              child: Image.asset(
                "images/dice$rightDiceNumber.png",
                color: Colors.black,
              ),
            ),
          ),
        ]),
        Row(children: [
          Expanded(
            child: Text(l,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                )),
          ),
          Expanded(
            child: Text(
              r,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 40.0,
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
