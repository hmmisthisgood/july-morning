import "package:flutter/material.dart";

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      drawer: Drawer(),
      bottomNavigationBar: Container(color: Colors.red, height: 55),
      body: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.green,
                // borderRadius: BorderRadius.circular(14),
                shape: BoxShape.circle),
            child: Text("Apppppp"),
          ),
          Text("1 23"),
          Text("1 23"),
          Text("1 23"),
          Text("1 23"),
          Text("1 23"),
          Text("1 23"),
          Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.green,
                // borderRadius: BorderRadius.circular(14),
                shape: BoxShape.circle),
            child: Text("Apppppp"),
          ),
        ],
      ),
    );
  }
}


/// Important Widgets 
/// 1. Scaffold : used to create screens
/// 2. Container : Just a box 
/// 3. Text
/// 4. Image
/// 5. Icon, IconButton 
/// 6. ListView, PageView, GridView
/// 7. MaterialButton, TextButton, FlatButton
/// 8. InkWell, GestureDetector
/// 9. Padding, SizedBox


/// for positiong: 
/// 1. Center 
/// 2. Align
/// 

/// Layout
/// 1. Row 
/// 2. Column
/// 4. Stack
/// 5. Expanded
/// 6. Flexible