import 'package:first_app/screen/row_column.dart';
import 'package:flutter/material.dart';
import 'screen/followers_screen.dart';
import 'screen/homepage.dart';
import 'screen/list_view_screen.dart';

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
      home: FollowersScreen(),
    );
  }
}


/// MaterialApp : to provide the basic config of the appRowColumnScreen