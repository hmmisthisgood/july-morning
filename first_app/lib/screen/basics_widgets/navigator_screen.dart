import 'package:first_app/navigation/routes.dart';
import 'package:first_app/screen/basics_widgets/pageview_screen.dart';
import 'package:first_app/screen/basics_widgets/row_column.dart';
import 'package:first_app/screen/basics_widgets/stack_screen.dart';
import 'package:first_app/screen/basics_widgets/tik_tok_page_skeleton.dart';

import 'package:flutter/material.dart';
import '../stful/basic_stateful_screen.dart';
import '../stful/bottom_nav_screen.dart';
import '../stful/form_screen.dart';
import '../stful/tabview.dart';

import 'followers_screen.dart';
import 'grid_view_screen.dart';
import 'homepage.dart';
import 'list_view_screen.dart';
import 'misc_widgets.dart';
import 'dart:math';

class NaivgatorScreen extends StatelessWidget {
  NaivgatorScreen({Key? key}) : super(key: key);

  final List screensList = [
    {
      "name": "Homepage",
      "widget": Homepage(),
      "route": Routes.homepage,
    },
    {"name": "Followers", "widget": FollowersScreen()},
    {"name": "Gridview", "widget": GridViewScreen()},
    {"name": "Listview", "widget": ListviewScreen()},
    {"name": "Miscallaneous", "widget": MiscWidgets()},
    {"name": "Pageview", "widget": PageViewScreen()},
    {"name": "RowColumn", "widget": RowColumnScreen()},
    {"name": "STack", "widget": StackScreen()},
    {"name": "Tit tok skeleton", "widget": TkSkeleton()},
    {"name": "Counter", "widget": CounterScreen()},
    {"name": "Dashboard", "widget": DashboardScreen()},
    {"name": "Login ", "widget": FormScreen()},
    {"name": "Tab", "widget": TabScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigation")),
      body: ListView.builder(
        itemCount: screensList.length,
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (context, index) {
          final screen = screensList[index];
          return MaterialButton(
            onPressed: () {
              /// Route:
              /// MaterialPageRoute
              /// CupeertinoPageRoute

              // MaterialPageRoute(builder: (con) => Homepage());

              // final route =
              //     MaterialPageRoute(builder: (con) => screen["widget"]);
              // Navigator.push(context, route);

              Navigator.pushNamed(context, screen["route"]);
            },
            color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
                Random().nextInt(255), 1),
            child: Text(
              screen["name"],
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
