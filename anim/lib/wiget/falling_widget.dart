import 'dart:math';

import 'package:flutter/material.dart';

class FallingWidget extends StatefulWidget {
  const FallingWidget(
      {Key? key,
      this.duration = const Duration(seconds: 2),
      this.repeat = true,
      this.offset = const Offset(300, 300),
      this.rotatingText = "abc",
      this.containerColor = Colors.black})
      : super(key: key);
  final Duration duration;
  final Offset offset;
  final String rotatingText;
  final Color containerColor;
  final bool repeat;
  @override
  State<FallingWidget> createState() => _AnimBuilderScreenState();
}

class _AnimBuilderScreenState extends State<FallingWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
      reverseDuration: Duration(seconds: 5),
    );
    animationController.forward();

    if (widget.repeat) animationController.repeat();

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
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  // dx,dy

  Widget buildCirlce(value) {
    return InkWell(
      onTap: () {
        animationController.reverse();
      },
      child: Transform.translate(
        offset: Offset(value * widget.offset.dx, value * widget.offset.dy),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: widget.containerColor,
              shape: BoxShape.circle,
              border: Border.all()),
          child: Transform.scale(
            scale: 1,
            child: Transform.rotate(
              angle: 2 * pi * value,
              child: Text(
                widget.rotatingText,
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
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        final value = animationController.value;

        /// 0.0>value<1.0
        ///
        return buildCirlce(value);
      },
    );
  }
}

/// AnimationController
