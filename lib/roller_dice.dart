import 'dart:math';

import 'package:flutter/material.dart';

const numberOfRounds = 5;

class RollerDice extends StatefulWidget {
  const RollerDice({super.key});

  @override
  State<RollerDice> createState() => _RollerDiceState();
}

class _RollerDiceState extends State<RollerDice> {
  int diceNumber = 1;
  int round = 0;
  int playerOneWins = 0;
  int playerTwoWins = 0;
  int playerOneRoud = 1;
  int playerTwoRoud = 1;
  List<int> playerOneScores = [];
  List<int> playerTwoScores = [];
  String whoWins = '';

  playerOneAction() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      playerOneScores.add(diceNumber);
      playerOneRoud += 1;
    });
  }

  playerTwoAction() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      playerTwoScores.add(diceNumber);
      playerTwoRoud += 1;
    });
  }

  updateRound() {
    setState(() {
      if (playerOneRoud == playerTwoRoud && round <= numberOfRounds) {
        if (playerOneScores[round] > playerTwoScores[round]) {
          playerOneWins += 1;
        } else if (playerTwoScores[round] > playerOneScores[round]) {
          playerTwoWins += 1;
        }
        round += 1;
      }
      if (round == numberOfRounds) {
        if (playerOneWins > playerTwoWins) {
          whoWins = 'Player 1 Wins!';
        } else if (playerTwoWins > playerOneWins) {
          whoWins = 'Player 2 Wins!';
        } else {
          whoWins = 'It\'s a Draw!';
        }
      }
    });
  }

  reset() {
    setState(() {
      diceNumber = 1;
      round = 0;
      playerOneWins = 0;
      playerTwoWins = 0;
      playerOneRoud = 1;
      playerTwoRoud = 1;
      playerOneScores = [];
      playerTwoScores = [];
    });
  }

  bool isPlayerOneButtonDisable() {
    if (playerOneRoud > playerTwoRoud) {
      return true;
    }
    return false;
  }

  bool isPlayerTwoButtonDisable() {
    if (playerOneRoud == playerTwoRoud) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        round == numberOfRounds
            ? Column(
                children: [
                  const Text('Game Over!',
                      style: TextStyle(color: Colors.red, fontSize: 28, fontWeight: FontWeight.w900)),
                  Text(whoWins,
                      style:
                          const TextStyle(color: Colors.green, fontSize: 28, fontWeight: FontWeight.w900)),
                  TextButton(
                      onPressed: reset,
                      child: const Text('Start a New Game!',
                          style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w900))),
                ],
              )
            : Column(
                children: [
                  Text(
                    'Round ${(round + 1)}',
                    style: const TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'assets/images/roller-dice-$diceNumber.jpg',
                    width: 200,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: isPlayerOneButtonDisable()
                              ? null
                              : playerOneAction,
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.red[900],
                              foregroundColor: Colors.white,
                              textStyle: const TextStyle(fontSize: 18)),
                          child: const Text('Roll -> Player 1')),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                          onPressed: isPlayerTwoButtonDisable()
                              ? null
                              : () {
                                  playerTwoAction();
                                  updateRound();
                                },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.red[900],
                              foregroundColor: Colors.white,
                              textStyle: const TextStyle(fontSize: 18)),
                          child: const Text('Roll -> Player 2')),
                    ],
                  ),
                ],
              ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Player 1: $playerOneWins           Player 2 : $playerTwoWins',
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('Round #',
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
                for (int r = 1; r <= playerOneScores.length; r++)
                  Text(
                    'Round $r',
                    style: const TextStyle(fontSize: 20),
                  )
              ],
            ),
            const SizedBox(
              width: 35,
            ),
            Column(
              children: [
                const Text('Player 1',
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
                for (var value in playerOneScores) Text(value.toString(),style: const TextStyle(fontSize: 20),)
              ],
            ),
            const SizedBox(
              width: 35,
            ),
            Column(
              children: [
                const Text('Player 2',
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
                for (var value in playerTwoScores) Text(value.toString(),style: const TextStyle(fontSize: 20),)
              ],
            )
          ],
        )
      ],
    );
  }
}
