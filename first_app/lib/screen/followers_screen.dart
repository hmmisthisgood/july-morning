import 'package:flutter/material.dart';

class FollowersScreen extends StatelessWidget {
  List<String> countries = [
    "China",
    "Nepal",
    "India",
    "US",
    "UK",
    "UAE",
    "France",
    "Italy",
    "Peru",
    "China",
    "Nepal",
    "India",
    "US",
    "UK",
    "UAE",
    "France",
    "Italy",
    "Peru"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("some_guy"),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(width: 60, height: 35, color: Colors.green),
            title: Text(
              countries[index], //
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            subtitle: Text("Kathmandu"),
            trailing: Text(
              "+977",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          );
        },
        // separatorBuilder: (context, index) {
        //   return Divider(
        //     thickness: 1.5,
        //     color: Colors.black.withOpacity(0.2),
        //   );
        // },
      ),
    );
  }
}

// 

// ListTile 
// Divider