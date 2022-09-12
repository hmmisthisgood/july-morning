import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieScreen extends StatelessWidget {
  const LottieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Lottie.asset("assets/animation/apple.json", height: 100),
        Lottie.asset("assets/animation/car.json"),
        Image.asset(
          "assets/animation/applecut.gif",
          height: 100,
        )
      ]),
    );
  }
}
