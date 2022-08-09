import 'package:flutter/material.dart';
import 'dart:math';

class PageViewScreen extends StatelessWidget {
  PageViewScreen({Key? key}) : super(key: key);

  // var randInt = Random().nextInt(255);

  List<Color> colors = [
    Color.fromRGBO(
        Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1),
    Colors.purple,
    Colors.black,
    Colors.white,
    Colors.green,
    Colors.purple,
    Colors.black,
    Colors.white,
    Colors.green,
    Colors.purple,
    Colors.black,
    Colors.white,
    Colors.green,
    Colors.purple,
  ];

  var something = List<Color>.generate(
    100,
    (index) => Color.fromRGBO(
        Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1),
  );

  // 0-255
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: something.length,
        itemBuilder: (context, index) {
          return Container(color: something[index]);
        },
      ),
    );
  }
}
