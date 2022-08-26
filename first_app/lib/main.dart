import 'package:first_app/screen/stful/form_screen.dart';
import 'package:first_app/screen/stful/sql_note_app.dart';
import 'package:flutter/material.dart';

import 'navigation/custom_route_generator.dart';
import 'navigation/routes.dart';

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
      theme: ThemeData(primarySwatch: Colors.purple),
      // home: FormScreen(pageTitle: "Not login"),
      home: SqlNoteScreen(),
      //  Routes.splash,
      onGenerateRoute: ourRouteGenerator,
    );
  }
}


/// MaterialApp : to provide the basic config of the appRowColumnScreen