import 'package:first_app/navigation/routes.dart';
import 'package:first_app/screen/auth/login_screen.dart';
import 'package:first_app/screen/basics_widgets/followers_screen.dart';
import 'package:first_app/screen/basics_widgets/grid_view_screen.dart';
import 'package:first_app/screen/basics_widgets/homepage.dart';
import 'package:first_app/screen/basics_widgets/list_view_screen.dart';
import 'package:first_app/screen/basics_widgets/misc_widgets.dart';
import 'package:first_app/screen/basics_widgets/splash_screen.dart';
import 'package:first_app/screen/stful/basic_stateful_screen.dart';
import 'package:first_app/screen/stful/bottom_nav_screen.dart';
import 'package:first_app/screen/stful/form_screen.dart';
import 'package:first_app/screen/stful/tabview.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screen/basics_widgets/pageview_screen.dart';
import 'package:first_app/screen/basics_widgets/row_column.dart';
import 'package:first_app/screen/basics_widgets/stack_screen.dart';
import 'package:first_app/screen/basics_widgets/tik_tok_page_skeleton.dart';

import '../screen/auth/signup_screen.dart';

Route ourRouteGenerator(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splash:
      return MaterialPageRoute(builder: (_) => SplashScreen());

    case Routes.homepage:
      return MaterialPageRoute(builder: (_) => Homepage());
    case Routes.followers:
      return MaterialPageRoute(builder: (_) => FollowersScreen());

    case Routes.gridview:
      return MaterialPageRoute(builder: (_) => GridViewScreen());
    case Routes.listview:
      return MaterialPageRoute(builder: (_) => ListviewScreen());
    case Routes.misc:
      return MaterialPageRoute(builder: (_) => MiscWidgets());
    case Routes.pageview:
      return MaterialPageRoute(builder: (_) => PageViewScreen());
    case Routes.rowcolumn:
      return MaterialPageRoute(builder: (_) => RowColumnScreen());
    case Routes.stack:
      return MaterialPageRoute(builder: (_) => StackScreen());
    case Routes.tiktokSk:
      return MaterialPageRoute(builder: (_) => TkSkeleton());
    case Routes.counter:
      return MaterialPageRoute(builder: (_) => CounterScreen());

    case Routes.dashboard:
      final args = settings.arguments as Map;

      return MaterialPageRoute(
          builder: (_) => DashboardScreen(
                username: args['username'],
              ));

    case Routes.login:
      return MaterialPageRoute(
          builder: (_) => LoginScreen(
                pageTitle: "",
                randomValue: "",
              ));
    case Routes.signup:
      return MaterialPageRoute(builder: (_) => SignupScreen(pageTitle: ""));

    case Routes.tabview:
      return MaterialPageRoute(builder: (_) => TabScreen());

    default:
      return MaterialPageRoute(builder: (_) => FormScreen());
  }
}
