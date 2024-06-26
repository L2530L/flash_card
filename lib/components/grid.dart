import 'dart:math';

import 'package:flash_card/components/card.dart';
import 'package:flash_card/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Subj extends StatelessWidget {
  final String name;
  final String deck_name;
  final void Function() navigator;

  const Subj(
      {super.key,
      required this.deck_name,
      required this.name,
      required this.navigator});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 75,
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Material(
        borderRadius: BorderRadius.circular(11),
        color: Colors.grey.shade400,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Text(
              deck_name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          onTap: navigator,
        ),
      ),
    );
  }
}
