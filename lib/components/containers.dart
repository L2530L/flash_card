// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  final Widget child;

  const Containers({super.key, required this.child});

// CONTAINER EDIT

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(24)),
      margin: EdgeInsets.all(10),
      width: 400,
      height: 400,
      child: Center(child: child),
    );
  }
}
