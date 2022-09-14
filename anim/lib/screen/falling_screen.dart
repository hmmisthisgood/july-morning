import 'dart:math';

import 'package:anim/wiget/falling_widget.dart';
import 'package:flutter/material.dart';

class FallingScreen extends StatelessWidget {
  const FallingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        FallingWidget(
          duration: Duration(seconds: 5),
          offset:
              Offset(Random().nextDouble() * 500, Random().nextDouble() * 500),
          containerColor: Color.fromRGBO(Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255), 1),
          rotatingText: "z",
          repeat: false,
        ),
        FallingWidget(
          duration: Duration(seconds: 5),
          offset:
              Offset(Random().nextDouble() * 500, Random().nextDouble() * 500),
          containerColor: Color.fromRGBO(Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255), 1),
          rotatingText: "s",
          repeat: false,
        ),
        FallingWidget(
          duration: Duration(seconds: 5),
          offset:
              Offset(Random().nextDouble() * 500, Random().nextDouble() * 2000),
          containerColor: Color.fromRGBO(Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255), 1),
          rotatingText: "",
          repeat: false,
        ),
        FallingWidget(
          duration: Duration(seconds: 5),
          offset:
              Offset(Random().nextDouble() * 500, Random().nextDouble() * 1000),
          containerColor: Color.fromRGBO(Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255), 1),
          rotatingText: "abc",
          repeat: false,
        ),
        FallingWidget(
          duration: Duration(seconds: 3),
          offset:
              Offset(Random().nextDouble() * 500, Random().nextDouble() * 2000),
          containerColor: Color.fromRGBO(Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255), 1),
          rotatingText: "aa",
          repeat: true,
        ),
        FallingWidget(
          duration: Duration(seconds: 2),
          offset:
              Offset(Random().nextDouble() * 500, Random().nextDouble() * 2000),
          containerColor: Color.fromRGBO(Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255), 1),
          rotatingText: "123",
          repeat: true,
        ),
        FallingWidget(
          duration: Duration(seconds: 3),
          offset:
              Offset(Random().nextDouble() * 500, Random().nextDouble() * 1000),
          containerColor: Color.fromRGBO(Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255), 1),
          rotatingText: "",
          repeat: false,
        ),
        // Expanded(child: FallingWidget()),
        // Expanded(child: FallingWidget()),
      ],
    ));
  }
}
