import 'package:flutter/material.dart';

import 'screen/stful/basic_stateful_screen.dart';

/// only one in a flutter project
void main() {
  runApp(OurApp()); // starts running our app
}

class OurApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// MaterialApp: only one in the whole app
    return MaterialApp(
      title: "Our app",
      home: CounterScreen(),
    );
  }
}


/// MaterialApp : to provide the basic config of the appRowColumnScreen