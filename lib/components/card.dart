import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class Card extends StatelessWidget {
  const Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlipCard(front: Text('1 + 1'), back: Text('2'))
    );
  }
}