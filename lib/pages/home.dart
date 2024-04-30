// ignore_for_file: prefer_const_constructors

import 'package:flash_card/components/card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FlashCard> deck = [
    FlashCard(
      frontText: "dsadsa",
      backText: "2",
    ),
    FlashCard(
      frontText: "dsadsa",
      backText: "2",
    ),
    FlashCard(
      frontText: "dsadsa",
      backText: "2",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlashCard(
      frontText: "dsadsa",
      backText: "2",
    ));
  }
}
