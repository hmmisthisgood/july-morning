import 'package:anim/screen/hero1.dart';
import 'package:anim/screen/lottie_animation.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  List screens = [
    {"title": "Hero animation", "widget": Hero1()},
    {"title": "Lottie animation", "widget": LottieScreen()},
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => page['widget']));
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