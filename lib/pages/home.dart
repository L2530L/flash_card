// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
        backgroundColor: Color.fromARGB(234, 0, 0, 0),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlashCard(
              frontText: "dsadsa",
              backText: "2",
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {},
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
