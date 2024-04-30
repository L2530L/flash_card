import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  final Widget child;

  const Containers({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
              color: Colors.grey.shade800,
              width: 400,
              height: 400,
              child: child,
    );
  }
}