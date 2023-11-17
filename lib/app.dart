import 'package:flutter/material.dart';
import 'package:roller_dice_game1/gradient_container.dart';

class RollerDiceApp extends StatelessWidget {
  const RollerDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('iCET Roller Dice'),
            backgroundColor: Colors.blueGrey[900],
          ),
          body: const GradientContainer(
            colors: [
              Color.fromRGBO(1, 53, 56, 1),
              Color.fromRGBO(2, 187, 208, 1)
            ],
          )),
    );
  }
}