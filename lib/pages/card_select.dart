// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flash_card/components/grid.dart';
import 'package:flash_card/pages/home.dart';
import 'package:flip_card/flip_card.dart';
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
    TextEditingController frontController = TextEditingController();
    TextEditingController backController = TextEditingController();

    
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
    List deck1 = decks[0]['deck'];

    List<String> dropValues =
        decks.map((deckName) => deckName['name'].toString()).toList();

    String dropdownValue = dropValues.first;

    void showBox() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('Front')),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('Back')),
              )
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                DropdownMenu<String>(
                  initialSelection: dropdownValue,
                  dropdownMenuEntries: dropValues
                      .map<DropdownMenuEntry<String>>((String values) {
                    return DropdownMenuEntry(value: values, label: values);
                  }).toList(),
                  onSelected: (index) {
                    setState(() {
                      dropdownValue = index!;
                    });
                  },
                ),

                //Button to add card
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        int selected = dropValues.indexOf(dropdownValue).abs();
                        decks[selected]['deck'].add(FlashCard(
                            frontText: frontController.text,
                            backText: backController.text,
                            controller: flipControl));
                      });
                      print(decks[0]['deck']);
                      print(decks[1]['deck']);
                    },
                    child: Icon(Icons.add)),
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
            builder: (context) => HomePage(
              deck: decks[0]['deck'],
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Grid(
            deck_name: "Science",
            name: decks[1]['name'],
            builder: (context) => HomePage(
              deck: decks[1]['deck'],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showBox,
        child: Icon(Icons.add),
      ),
    );
  }
}
