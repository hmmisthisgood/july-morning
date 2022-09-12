import 'dart:math';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AnimContainerScreen extends StatefulWidget {
  const AnimContainerScreen({Key? key}) : super(key: key);

  @override
  State<AnimContainerScreen> createState() => AnimContainerScreenState();
}

class AnimContainerScreenState extends State<AnimContainerScreen> {
  double _height = 100;
  double _width = 100;
  Color _containerColor = Colors.green;
  double _radius = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        SizedBox(height: 20),
        Center(
          child: InkWell(
            onTap: () {
              _height = Random().nextDouble() * 400;
              _width = Random().nextDouble() * 250;
              _containerColor = Color.fromRGBO(Random().nextInt(255),
                  Random().nextInt(255), Random().nextInt(255), 1);
              _radius = Random().nextDouble() * 100;
              setState(() {});
            },
            child: AnimatedContainer(
              height: _height,
              width: _width,
              duration: Duration(milliseconds: 800),
              curve: Curves.fastLinearToSlowEaseIn,
              decoration: BoxDecoration(
                  color: _containerColor,
                  borderRadius: BorderRadius.circular(_radius)),
            ),
          ),
        ),
      ]),
    );
  }
}
