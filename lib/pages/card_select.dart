import 'package:flash_card/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
      crossAxisCount: 1,
      children: [
        Container(
          color: Colors.amber,
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ),
        ),

        //Container
        Container(
          color: Colors.black,
        ),
        Container(
          color: Colors.blue,
        ),
      ],
    ));
  }
}
