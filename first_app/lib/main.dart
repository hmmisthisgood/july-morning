import 'package:first_app/screen/basics_widgets/misc_widgets.dart';
import 'package:flutter/material.dart';

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
      home: MiscWidgets(),
    );
  }
}


/// MaterialApp : to provide the basic config of the appRowColumnScreen