import 'dart:math';
import 'package:flutter/material.dart';

class TransformScreen extends StatefulWidget {
  const TransformScreen({Key? key}) : super(key: key);

  @override
  State<TransformScreen> createState() => _TransformScreenState();
}

class _TransformScreenState extends State<TransformScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text("This will overlap"),
          Transform.rotate(
            angle: -pi / 2,
            child: Container(
              child: Text("Rotating text", style: TextStyle(fontSize: 30)),
            ),
          ),
          SizedBox(height: 150),
          Transform.scale(
            // scale: 0.5,
            scaleX: 3,
            scaleY: 10,
            child: Text("I am big"),
          ),
          Transform.translate(
            offset: Offset(-100, -200),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.lightBlue,
            ),
          ),
          Transform(
            transform: Matrix4(3, 0, 0, 0, 0, 3, 0, 0, 0, 0, 3, 0, 0, 0, 0, 1),
            child: Text("ABBC"),
          )
        ],
      ),
    );
  }
}

/// Types of trnsform 
/// 1. scale 
/// 2. rotate
/// 3. translate