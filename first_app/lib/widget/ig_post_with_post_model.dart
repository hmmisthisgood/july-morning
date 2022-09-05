import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/post.dart';

class IgPostWithModel extends StatelessWidget {
  final Post postData;

  IgPostWithModel({required this.postData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        postData.userImageUrl,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      postData.user,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Icon(Icons.menu_sharp)
              ],
            ),
          ),
          SizedBox(height: 10),
          CachedNetworkImage(
            imageUrl: postData.largeImageUrl,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
            placeholder: (context, url) {
              return Container(
                height: 200,
                width: double.infinity,
                color: Color.fromRGBO(Random().nextInt(255),
                    Random().nextInt(255), Random().nextInt(255), 0.4),
              );
            },
          ),
          // Image.network(
          //   postData.largeImageUrl,
          //   height: 200,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          //   // width: ,
          // ),
        ],
      ),
    );
  }
}
