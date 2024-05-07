import 'package:flash_card/components/card.dart';
import 'package:flash_card/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Grid extends StatelessWidget {
  final List<FlashCard> decks;
  final String deck_name;


  const Grid({super.key, required this.decks, required this.deck_name});

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Material(
            color: Colors.red,
            child: InkWell(
              child: Text(
                deck_name,
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      deck: decks,
                    ),
                  ),
                );
              },
            ),
          ),
        );
  }
}