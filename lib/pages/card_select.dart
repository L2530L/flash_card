// ignore_for_file: prefer_const_constructors

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
  late final TextEditingController frontController;
  late final TextEditingController backController;

  late List<Map<String, dynamic>> decks = [];
  late List<String> dropValues;
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    frontController = TextEditingController();
    backController = TextEditingController();
    decks = [
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
      },
//dsadadas
      {
        'name': 'English',
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
        'name': 'Filipino',
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
    ];
    dropValues = decks.map((deckName) => deckName['name'].toString()).toList();
    dropdownValue = dropValues.first;
  }

  void showBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add a Card"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              autofocus: true,
              controller: frontController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Enter Question',
                    style: TextStyle(color: Colors.grey.shade700),
                  )),
            ),
            SizedBox(
              height: 14,
            ),
            TextField(
              controller: backController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Enter Answer',
                    style: TextStyle(color: Colors.grey.shade700),
                  )),
            )
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownMenu<String>(
                initialSelection: dropdownValue,
                dropdownMenuEntries:
                    dropValues.map<DropdownMenuEntry<String>>((String values) {
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
                  style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(2),
                      shadowColor:
                          MaterialStatePropertyAll(Colors.grey.shade800)),
                  onPressed: () {
                    setState(() {
                      int selected = dropValues.indexOf(dropdownValue).abs();
                      decks[selected]['deck'].add(FlashCard(
                          frontText: frontController.text,
                          backText: backController.text,
                          controller: flipControl));
                      frontController.clear();
                      backController.clear();
                    });
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  )),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          Subj(
            deck_name: "Mathematics",
            name: decks[0]['name'],
            navigator: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(deck: decks[0]['deck']),
                )),
          ),
          SizedBox(
            height: 14,
          ),
          Subj(
            deck_name: "Science",
            name: decks[1]['name'],
            navigator: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(deck: decks[1]['deck']),
                  ));
              print(decks[1]['deck']);
            },
          ),
          SizedBox(
            height: 14,
          ),
          Subj(
            deck_name: "English",
            name: decks[1]['name'],
            navigator: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(deck: decks[1]['deck']),
                  ));
              print(decks[1]['deck']);
            },
          ),
          SizedBox(
            height: 14,
          ),
          Subj(
            deck_name: "Filipino",
            name: decks[1]['name'],
            navigator: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(deck: decks[1]['deck']),
                  ));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade300,
        elevation: 4,
        hoverColor: Color.alphaBlend(Colors.grey.shade600, Colors.blue),
        onPressed: showBox,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
