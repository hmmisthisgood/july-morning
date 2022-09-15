import 'package:anim/painter/our_painter.dart';
import 'package:flutter/material.dart';

class CPainterSCreen extends StatelessWidget {
  const CPainterSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CustomPaint(
        painter: OurPainter(),
        child: Container(
          height: 100,
          width: 100,
        ),
      )),
    );
  }
}











/// CustomPaint
/// CustomPainter