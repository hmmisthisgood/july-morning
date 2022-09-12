import 'package:anim/screen/hero2.dart';
import 'package:anim/utils/constants.dart';
import 'package:flutter/material.dart';

class Hero1 extends StatelessWidget {
  const Hero1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Hero2()));
        },
        child: Hero(tag: "hero", child: Image.network(imageUrl)),
      ),
    );
  }
}

/// Hero widget