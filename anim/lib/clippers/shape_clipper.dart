import 'package:flutter/material.dart';

class ShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;

    Path path = Path();

    path.moveTo(50, 0);

    path.lineTo(width, 0);
    // path.lineTo(width, height);
    // path.lineTo(0, height);

    path.lineTo(width * 0.5, height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}

/// Path 
/// line
/// arc
/// rrect