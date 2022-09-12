import 'package:anim/utils/constants.dart';
import 'package:flutter/material.dart';

class Hero2 extends StatelessWidget {
  const Hero2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Hero(
            tag: "hero",
            child: Image.network(imageUrl),
          ),
        ],
      ),
    );
  }
}
