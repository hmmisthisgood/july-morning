import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  late TabController controller;

  List<String> tabNames = [
    "Home",
    "Gallery",
    "Trending",
    "Best seller",
    "Settings",
    "Buy"
  ];
  List tabIcons = [
    Icons.dashboard,
    Icons.image,
    Icons.dashboard,
    Icons.image,
    Icons.dashboard,
    Icons.image,
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 6, vsync: this);

    controller.addListener(
      () {
        print(controller.index);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // bottom: TabBar(
          //   controller: controller,
          //   tabs: [
          //     Text("Home"),
          //     Text("Othesrs"),
          //   ],
          // ),
          ),
      body: Column(
        children: [
          Container(
            height: 450,
            color: Colors.orange,
          ),
          Container(
            // color: Colors.black,
            height: 50,
            child: TabBar(
                controller: controller,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                // padding: EdgeInsets.symmetric(vertical: 20),
                onTap: (index) {
                  print("You clicked $index");
                },
                tabs: List.generate(tabNames.length, (index) {
                  return Text(tabNames[index]);
                })
                // List.generate(tabIcons.length, (index) {
                //   return Icon(tabIcons[index]);
                // })

                // [
                // Icon(Icons.dashboard, size: 40),
                // Icon(Icons.image, size: 40),
                // Icon(Icons.dashboard, size: 40),
                // Icon(Icons.image, size: 40),
                // Icon(Icons.dashboard, size: 40),
                // Icon(Icons.image, size: 40),
                //   Text("Application"),
                //   Text("Application"),
                //   Text("Application"),
                //   Text("Application"),
                //   Text("Application"),
                //   Text("Application"),
                // ],
                ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                Container(
                  color: Colors.green,
                  child: Column(
                      // children: [
                      //   TabBar(
                      //     controller: controller,
                      //     tabs: [Text("A"), Text("B")],
                      //   ),
                      // ],
                      ),
                ),
                Container(color: Colors.purple),
                Container(color: Colors.red),
                Container(color: Colors.black),
                Container(color: Colors.blue),
                Container(color: Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// TabBar
/// TabBarView
