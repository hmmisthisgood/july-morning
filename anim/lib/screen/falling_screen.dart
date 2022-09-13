import 'package:anim/wiget/falling_widget.dart';
import 'package:flutter/material.dart';

class FallingScreen extends StatelessWidget {
  const FallingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        FallingWidget(),
      ],
    ));
  }
}
