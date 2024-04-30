// ignore_for_file: prefer_const_constructors

import 'package:flash_card/components/containers.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FlashCard extends StatelessWidget {
  final String frontText;
  final String backText;
  const FlashCard({super.key, required this.frontText, required this.backText});

//TEXT EDIT

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FlipCard(
            // FRONT
            front: Containers(
                child: Text(
              frontText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            )),

            // BACK
            back: Containers(
                child: Text(
              backText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ))));
  }
}
