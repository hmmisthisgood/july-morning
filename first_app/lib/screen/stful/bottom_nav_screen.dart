import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:first_app/screen/basics_widgets/grid_view_screen.dart';
import 'package:first_app/screen/basics_widgets/list_view_screen.dart';
import 'package:first_app/screen/basics_widgets/stack_screen.dart';
import 'package:first_app/util/shared_pref.dart';
import 'package:flutter/material.dart';

import 'form_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key, required this.username}) : super(key: key);
  final String username;
  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final iconsList = [Icons.home, Icons.search, Icons.settings, Icons.person];
  final pageList = [
    GridViewScreen(iconsCount: 5),
    ListviewScreen(),
    FormScreen(),
    StackScreen(),
  ];
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    print("build");
    return WillPopScope(
      onWillPop: () async {
        print("back button pressed");
        return false;
      },
      child: Scaffold(
          // bottomNavigationBar: BottomNavigationBar(
          //   onTap: (index) {
          //     print("I am clicked, $index");
          //     _currentIndex = index;
          //     print("current index is: $_currentIndex");
          //     setState(() {});
          //   },
          //   currentIndex: _currentIndex,
          //   items: [
          //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          //   ],
          // ),
          appBar: AppBar(title: Text(widget.username)),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            // color: Colors.yellow,
            child: AnimatedBottomNavigationBar(
              backgroundColor: Colors.black,
              iconSize: 34,
              notchMargin: 5,
              notchSmoothness: NotchSmoothness.verySmoothEdge,
              activeColor: Colors.blue,
              inactiveColor: Colors.white,
              gapLocation: GapLocation.center,
              icons: iconsList,
              activeIndex: _currentIndex,
              onTap: (index) {
                _currentIndex = index;
                setState(() {});
                pageController.jumpToPage(index);
              },
            ),
          ),
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: pageList,
          )
          //  pageList[_currentIndex],
          ),
    );
  }
}

// BottomNavigationBar
// BottomAppBar
// Custom bototm nav bar

// Icons.home >> IconData = name of the icons
// Icon(Icons.home) = widget

/// Will Pop Scope?