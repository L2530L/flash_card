// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flash_card/components/card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<FlashCard> deck;
  const HomePage({super.key, required this.deck});

  @override
  State<HomePage> createState() => _HomePageState();
}

FlipCardController flipControl = FlipCardController();

class _HomePageState extends State<HomePage> {
  int index = 0;
  bool isFront = true;
  var cardState = FlipCardState(true);
  


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.grey.shade700,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.deck[index],
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {
                  if (index < widget.deck.length - 1) {
                    setState(() {
                      if (widget.deck[index].controller.state!.isFront) {
                        index += 1;
                      } else {
                        index += 1;
                        widget.deck[index].controller.toggleCardWithoutAnimation();
                      }
                    });
                  } else {
                    setState(() {
                      if (widget.deck[index].controller.state!.isFront) {
                        index = 0;
                      } else {
                        index = 0;
                        flipControl.toggleCardWithoutAnimation();
                      }
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
