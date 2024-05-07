// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flash_card/components/card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

FlipCardController flipControl = FlipCardController();

class _HomePageState extends State<HomePage> {
  int index = 0;
  bool isFront = true;
  var cardState = FlipCardState(true);

  List<FlashCard> deck = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            deck[index],
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(Colors.white70),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(153, 253, 253, 253)),
                ),
                onPressed: () {
                  if (index < deck.length - 1) {
                    setState(() {
                      if (deck[index].controller.state!.isFront) {
                        index += 1;
                      } else {
                        index += 1;
                        deck[index].controller.toggleCardWithoutAnimation();
                      }
                    });
                  } else {
                    setState(() {
                      if (deck[index].controller.state!.isFront) {
                        index = 0;
                      } else {
                        index = 0;
                        flipControl.toggleCardWithoutAnimation();
                      }
                    });
                  }
                },
                child: Text("Next Card",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )))
          ],
        ));
  }
}
