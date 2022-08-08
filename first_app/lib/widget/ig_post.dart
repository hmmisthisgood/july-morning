import 'package:flutter/material.dart';

class IgPost extends StatelessWidget {
  final String imageSrc =
      "https://cdn.pixabay.com/photo/2022/06/27/08/37/monk-7287041_960_720.jpg";

  Map postData;

  IgPost({required this.postData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      postData["profilePicture"],
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    postData['username'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Icon(Icons.menu_sharp)
            ],
          ),
        ),
        Image.network(
          postData["postUrl"],

          height: 200,
          // width: ,
        ),
      ],
    );
  }
}
