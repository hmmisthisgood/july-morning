import 'dart:math';

import 'package:flutter/material.dart';

class AnimBuilderScreen extends StatefulWidget {
  const AnimBuilderScreen({Key? key}) : super(key: key);

  @override
  State<AnimBuilderScreen> createState() => _AnimBuilderScreenState();
}

class _AnimBuilderScreenState extends State<AnimBuilderScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
      reverseDuration: Duration(seconds: 5),
    );
    animationController.forward();
    animationController.repeat();

    animationController.addListener(() {
      bool isCompleted = animationController.isCompleted;
      bool isAnimating = animationController.isAnimating;

      // if (isCompleted) {
      //   animationController.reverse();
      // }
    });
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  Widget buildCirle({value, width, height, color, text}) {
    return InkWell(
      onTap: () {
        animationController.reverse();
      },
      child: Transform.translate(
        offset: Offset(value * width, value * height), // (x,y)
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(), color: color),
          child: Transform.scale(
            scale: 1,
            child: Transform.rotate(
              angle: 2 * pi * value,
              child: Text(
                text,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            final value = animationController.value;
            return Row(
              children: [
                buildCirle(
                    value: value,
                    width: width,
                    height: height,
                    text: "aa",
                    color: Colors.green),
                buildCirle(
                    value: value,
                    width: width / 2,
                    height: height / 2,
                    text: "abc",
                    color: Colors.blue),
                buildCirle(
                    value: value,
                    width: width / 3,
                    height: height / 3,
                    text: "cde",
                    color: Colors.black),
                buildCirle(
                    value: value,
                    width: width,
                    height: height / 2,
                    text: "",
                    color: Colors.purple),
                buildCirle(
                    value: value,
                    width: width,
                    height: height,
                    text: "",
                    color: Colors.green),
                buildCirle(
                    value: value,
                    width: width / 2,
                    height: height / 2,
                    text: "",
                    color: Colors.blue),
                buildCirle(
                    value: value,
                    width: width / 3,
                    height: height / 3,
                    text: "",
                    color: Colors.black),
                buildCirle(
                    value: value,
                    width: width,
                    height: height / 2,
                    text: "",
                    color: Colors.purple),
              ],
            );

            /// 0.0>value<1.0
            ///
          },
        ),
      ),
    );
  }
}

/// AnimationController
