import 'package:flutter/material.dart';

import '../util/constants.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            imageSrc,
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
            height: screenHeight,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black.withOpacity(0.8),
              Colors.white.withOpacity(0.3)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),

          Positioned(
            right: 30,
            top: 30,
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text("1/20"),
            ),
          ),

          // Positioned(
          //   left: 0,
          //   right: 0,
          //   // top: 700,
          //   bottom: 200,
          //   child: Text(
          //     "1/20",
          //     style: TextStyle(fontSize: 24, color: Colors.white),
          //   ),
          // ),
          // Positioned(
          //     left: 0,
          //     right: 0,
          //     // top: 700,
          //     bottom: 195,
          //     child: Container(
          //       color: Colors.white,
          //       height: 30,
          //       width: 50,
          //     )),

          Align(
            alignment: Alignment.center,
            child: Text(
              "Our app",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}


// Positioned 
// Align