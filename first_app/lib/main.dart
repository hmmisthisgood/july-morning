import 'package:first_app/screen/row_column.dart';
import 'package:flutter/material.dart';
import 'screen/homepage.dart';

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
      home: RowColumnScreen(),
    );
  }
}


/// MaterialApp : to provide the basic config of the app