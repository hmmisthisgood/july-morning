import 'package:first_app/util/constants.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class MiscWidgets extends StatelessWidget {
  const MiscWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Miscaalleanous")),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              print("I am pressed");
            },
            color: Colors.purple,
            minWidth: 150,
            height: 53,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              "Press Me",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
              onPressed: () {
                print("I am pressed: text button");
              },
              child: Text("Press me again")),
          InkWell(
            onTap: () {
              print("photo pressed. Double to like");
            },
            onDoubleTap: () {
              print("Yay i am liked");
            },
            onLongPress: () {
              print("pressed me for long time");
            },
            child: Image.network(
              imageSrc,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          GestureDetector(
            child: Text("Swipe me"),
          ),
          Switch(
            value: false,
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }
}

/// MaterialButton, TextButton
/// InkWell , GestureDetector