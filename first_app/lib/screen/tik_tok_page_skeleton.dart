import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class TkSkeleton extends StatelessWidget {
  const TkSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.orange,
      ),
      body: Stack(children: [
        /// first/lowermost : we need image or video

        Container(color: Colors.black),

        /// Follow/following Text
        Positioned(
          top: 50,
          left: 100,
          child: Container(
            height: 40,
            width: 200,
            color: Colors.green,
          ),
        )

        /// right or bottom right side ko like, comment, share section
        ,
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 90,
            height: 350,
            color: Colors.pink,
          ),
        ),

        /// bottom left  captions

        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 150,
              width: 200,
              color: Colors.yellow,
            ))
      ]),
    );
  }
}
