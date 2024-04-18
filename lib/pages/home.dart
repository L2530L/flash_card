// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flash_card/components/card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  bool isFront = true;
  var cardState = FlipCardState(true);



  List<FlashCard> deck = [
    FlashCard(
      frontText: "1+0",
      backText: "1",
    ),
    FlashCard(
      frontText: "1+1",
      backText: "2",
    ),
    FlashCard(
      frontText: "2+1",
      backText: "3",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(234, 0, 0, 0),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            deck[index],
            
            SizedBox(
              height: 10,
            ),

            ElevatedButton(
                onPressed: () {
                  if (index < deck.length-1) {
                    setState(() {
                      index += 1;
                    });
                  } else {
                    setState(() {
                      index = 0;
                    });
                  }
                },


                child: Text(
                  "Next Card",
                  style: TextStyle(
                      color: Color.fromARGB(160, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ))
          ],
        ));
  }
}
