import 'package:flutter/material.dart';
import 'package:roller_dice_game1/roller_dice.dart';


class NewGame extends StatefulWidget {
  const NewGame({super.key});

  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  bool isGameStarted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: isGameStarted
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const RollerDice(),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    child: const Text(
                      '< Back to Home',
                      style: TextStyle(color: Color.fromARGB(255, 230, 173, 2), fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    onTap: () {
                      setState(() {
                        isGameStarted = false;
                      });
                    },
                  )
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 100),
                      child: const Text(
                        'Welcome to Roller Dice Game!',
                        style: TextStyle(color: Colors.white, fontSize: 32, fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            isGameStarted = true;
                          });
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.amber[200],
                            foregroundColor: Colors.black,
                            textStyle: const TextStyle(fontSize: 28, fontFamily: AutofillHints.birthday)),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text('Play New Game'),
                        ))
                  ]));
  }
}
