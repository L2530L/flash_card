// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flash_card/components/grid.dart';
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
        appBar: AppBar(
          title: Center(
              child: Text(
            "FlashCard ni OLOPSC",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          backgroundColor: Colors.grey.shade400,
          elevation: 2,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Grid(
              deck_name: "Mathematics",
              decks: decks,
            ),
            SizedBox(
              height: 14,
            ),
            Grid(
              deck_name: "Science",
              decks: science,
            ),
          ],
        ));
  }
}
