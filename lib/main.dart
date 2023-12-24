import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNum = 1;
  var rightDiceNum = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextButton(
              child: Image.asset("images/dice$leftDiceNum.png"),
              onPressed: () {
                updateDices();
              },
            ),
          ),
          Expanded(
            child: TextButton(
              child: Image.asset("images/dice$rightDiceNum.png"),
              onPressed: () {
                updateDices();
              },
            ),
          ),
        ],
      ),
    );
  }

  void updateDices() {
    int counter = 20;
    Timer? everySecond;
    everySecond = Timer.periodic(const Duration(milliseconds: 200), (Timer t) {
      counter--;
      setState(() {
        leftDiceNum = Random().nextInt(6) + 1;
        rightDiceNum = Random().nextInt(6) + 1;
      });
      if (counter <= 0) {
        if (everySecond != null) {}
        everySecond?.cancel();
      }
    });
  }
}
