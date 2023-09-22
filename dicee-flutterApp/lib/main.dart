import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 3;
  int rightDiceNum = 2;

  void DiceThrower() {
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TextButton(
              child: Image.asset('images/dice$leftDiceNum.png'),
              onPressed: () {
                DiceThrower();
                // Add your button onPressed logic here
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              child: Image.asset('images/dice$rightDiceNum.png'),
              onPressed: () {
                DiceThrower();
                // Add your button onPressed logic here
              },
            ),
          )
        ],
      ),
    );
  }
}
