// ignore_for_file: prefer_const_constructors

import 'package:flash_card/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<FlashCard> decks = [
      FlashCard(
        frontText: "1+0",
        backText: "1",
        controller: flipControl,
      ),
      FlashCard(
        frontText: "1+1",
        backText: "2",
        controller: flipControl,
      ),
      FlashCard(
        frontText: "2+1",
        backText: "3",
        controller: flipControl,
      ),
      FlashCard(
        frontText: "3x3",
        backText: "9",
        controller: flipControl,
      ),
    ];

    List<FlashCard> science = [
      FlashCard(
        frontText: "Powerhouse of the cell?",
        backText: "Mitochondria",
        controller: flipControl,
      ),
      FlashCard(
        frontText: "Which blood type is the rarest in humans?",
        backText: "AB Negative",
        controller: flipControl,
      ),
      FlashCard(
        frontText: "What is the only planet that spins clockwise?",
        backText: "Venus",
        controller: flipControl,
      ),
      FlashCard(
        frontText: "Bees are not present in which continent?",
        backText: "Antarctica",
        controller: flipControl,
      ),
    ];

    return Scaffold(
        body: GridView.count(
      mainAxisSpacing: 20,
      crossAxisCount: 1,
      children: [
        Container(
          child: Material(
            color: Colors.red,
            child: InkWell(
              child: Text(
                'Mathematics',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      deck: decks,
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        //Container
      ],
    ));
  }
}
