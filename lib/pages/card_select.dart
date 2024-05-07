// ignore_for_file: prefer_const_constructors

import 'package:flash_card/components/grid.dart';
import 'package:flash_card/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> decks = [
      {
        'name': 'Math',
        'deck': <FlashCard>[
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
        ]
      },
      {
        'name': 'Science',
        'deck': <FlashCard>[
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
        ],
      }
    ];

    String? drop = decks[0]['name'];

    void showBox() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Column(
            children: [TextField(), TextField()],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: drop,
                  items: [
                    DropdownMenuItem(
                      child: Text(decks[0]['name']),
                      value: decks[0]['name'],
                    ),
                    DropdownMenuItem(
                      child: Text(decks[1]['name']),
                      value: decks[1]['name'],
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      drop = value!;
                    });
                  },
                ),
                ElevatedButton(onPressed: () {}, child: Icon(Icons.add)),
              ],
            )
          ],
        ),
      );
    }

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
            name: decks[0]['name'],
            decks: decks[0]['deck'],
          ),
          SizedBox(
            height: 14,
          ),
          Grid(
            deck_name: "Science",
            name: decks[1]['name'],
            decks: decks[1]['deck'],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showBox();
      }),
    );
  }
}
