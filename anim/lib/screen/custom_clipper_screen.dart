import 'package:anim/clippers/shape_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class CClipperSCreen extends StatelessWidget {
  const CClipperSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: ClipPath(
        clipper: WaveClipperOne(),
        child: Container(
          height: 300,
          width: width,
          color: Colors.purple,
        ),
      ),
    ));
  }
}











/// Clip
/// CustomClipper