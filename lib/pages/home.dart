import 'package:flash_card/components/card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FlashCard> deck = [
    FlashCard(),
    FlashCard(),
    FlashCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FlashCard());
  }
}
