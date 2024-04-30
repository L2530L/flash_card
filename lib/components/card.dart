import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FlashCard extends StatelessWidget {
  const FlashCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FlipCard(
            front: Container(
              margin: EdgeInsets.all(10),
              color: Colors.grey.shade800,
              width: 400,
              height: 400,
              child: Text("dsadada"),
            ),
            back: Container(
              margin: EdgeInsets.all(10),
              color: Colors.grey.shade800,
              width: 400,
              height: 400,
              child: Text("dsadadadsadsada"),
            )));
  }
}
