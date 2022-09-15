import 'package:flutter/material.dart';

class OurPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    Paint brush = Paint();

    brush.color = Colors.red;
    brush.strokeCap = StrokeCap.round;

    Path tri = Path();

    tri.lineTo(width, 0);
    tri.lineTo(width, height);
    tri.close();

    canvas.drawPath(tri, brush);

    canvas.drawCircle(Offset.zero, 50, Paint()..color = Colors.green);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


/// Canvas= artboard or paper
/// Paint= brush
/// 