import 'package:cloud_firestore/cloud_firestore.dart';
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
  late final TextEditingController deckNameController;

  late List<Map<String, dynamic>> decks = [];
  late List<String> dropValues;
  late String dropdownValue;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    frontController = TextEditingController();
    backController = TextEditingController();
    deckNameController = TextEditingController();
    
    // Initialize with empty values
    dropValues = [];
    dropdownValue = '';
    
    // Load decks from Firestore
    loadDecks();
  }

  // Load decks from Firestore
  Future<void> loadDecks() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('flashcard_decks').get();
      setState(() {
        decks = querySnapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          // Convert Firestore data back to FlashCard objects
          List<dynamic> cards = data['cards'];
          return {
            'name': data['name'],
            'id': doc.id,
            'deck': cards.map((card) => FlashCard(
              frontText: card['frontText'],
              backText: card['backText'],
              controller: flipControl,
            )).toList(),
          };
        }).toList();

        dropValues = decks.map((deck) => deck['name'].toString()).toList();
        if (dropValues.isNotEmpty) {
          dropdownValue = dropValues.first;
        }
        isLoading = false;
      });
    } catch (e) {
      print('Error loading decks: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  // Add a new deck to Firestore
  Future<void> addDeckToFirestore(String deckName) async {
    try {
      await _firestore.collection('flashcard_decks').add({
        'name': deckName,
        'cards': [],
        'createdAt': FieldValue.serverTimestamp(),
      });
      await loadDecks(); // Reload decks after adding
    } catch (e) {
      print('Error adding deck: $e');
    }
  }

  // Add a card to existing deck in Firestore
  Future<void> addCardToDeck(String deckId, Map<String, String> card) async {
    try {
      DocumentReference deckRef = _firestore.collection('flashcard_decks').doc(deckId);
      await deckRef.update({
        'cards': FieldValue.arrayUnion([card])
      });
      await loadDecks(); // Reload decks after adding card
    } catch (e) {
      print('Error adding card: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "FlashCard ni OLOPSC",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.grey.shade400,
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: decks.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 7),
            child: Subj(
              deck_name: decks[index]['name'],
              name: decks[index]['name'],
              navigator: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(deck: decks[index]['deck']),
                ),
              ),
            ),
          );
        },
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

  // Create new deck dialog
  void createDeck() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create Deck'),
        content: TextField(
          controller: deckNameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text('Deck Name'),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (deckNameController.text.isNotEmpty) {
                await addDeckToFirestore(deckNameController.text);
                deckNameController.clear();
                Navigator.pop(context);
              }
            },
            child: Text('Create'),
          ),
        ],
      ),
    );
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
                ),
              ),
            ),
            SizedBox(height: 14),
            TextField(
              controller: backController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'Enter Answer',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
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
              Row(
                children: [
                  ElevatedButton(
                    onPressed: createDeck,
                    child: Text('New Deck'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(2),
                      shadowColor: MaterialStatePropertyAll(Colors.grey.shade800),
                    ),
                    onPressed: () async {
                      if (frontController.text.isNotEmpty &&
                          backController.text.isNotEmpty) {
                        int selected = dropValues.indexOf(dropdownValue);
                        await addCardToDeck(
                          decks[selected]['id'],
                          {
                            'frontText': frontController.text,
                            'backText': backController.text,
                          },
                        );
                        frontController.clear();
                        backController.clear();
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    frontController.dispose();
    backController.dispose();
    deckNameController.dispose();
    super.dispose();
  }
}