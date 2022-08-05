import 'package:first_app/widget/ig_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowColumnScreen extends StatelessWidget {
  final String imageSrc =
      "https://cdn.pixabay.com/photo/2022/06/27/08/37/monk-7287041_960_720.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Rows and Columns",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
          wordSpacing: 10,
        ),
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IgPost(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(height: 100, color: Colors.green, width: 100),
              Container(height: 100, color: Colors.red, width: 100),
              Container(height: 100, color: Colors.purple, width: 100),
            ],
          ),
          Container(height: 100, color: Colors.green),
          Container(height: 100, color: Colors.red),
          Container(height: 100, color: Colors.purple),
        ],
      ),
    );
  }
}



/// Icon 
/// IconButton 
/// SizedBox
/// Padding
/// Image = Image.network, Image.file, Image.asset, Image.memory
/// ClipRRect
/// 