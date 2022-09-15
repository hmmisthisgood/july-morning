import 'package:anim/page_transition/vertical_transitions.dart';
import 'package:anim/screen/custom_clipper_screen.dart';
import 'package:anim/screen/custom_painter_screen.dart';
import 'package:anim/screen/falling_screen.dart';
import 'package:anim/screen/hero1.dart';
import 'package:anim/screen/lottie_animation.dart';
import 'package:anim/screen/transform_screen.dart';
import 'package:flutter/material.dart';

import 'animated_builder_screen.dart';
import 'animated_container_screen.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  List screens = [
    {"title": "Hero animation", "widget": Hero1()},
    {"title": "Lottie animation", "widget": LottieScreen()},
    {"title": "Animated Container", "widget": AnimContainerScreen()},
    {"title": "Transform widget", "widget": TransformScreen()},
    {"title": "Animated builder", "widget": AnimBuilderScreen()},
    {"title": "Falling screen", "widget": FallingScreen()},
    {"title": "Custom Painter builder", "widget": CPainterSCreen()},
    {"title": "Custom Clipper screen", "widget": CClipperSCreen()},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: screens.length,
          itemBuilder: (context, index) {
            final page = screens[index];
            return MaterialButton(
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (_) => page['widget']));
                Navigator.push(context, BottomToUp(page['widget']));
              },
              color: Colors.green,
              child: Text(
                page['title'],
                style: TextStyle(color: Colors.white),
              ),
            );
          }),
    );
  }
}

/// Types of animations:
/// Implicit 
/// Explicit


/// Widgets: 
/// 1. Hero animation
/// 2. Lottie animation


/// 3. AnimatedContainer
/// 4. AnimatedIcon
/// 5. AnimatedBuilder
/// 6. AnimatedWidget
/// 7. AnimatedPositioned
/// 8. AnimatedAlign
/// 9. Transform
/// 10. CustomRouteTranstiion 