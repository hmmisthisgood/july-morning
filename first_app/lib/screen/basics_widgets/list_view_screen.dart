import 'package:first_app/widget/ig_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListviewScreen extends StatelessWidget {
  static final String imageSrc =
      "https://cdn.pixabay.com/photo/2022/06/27/08/37/monk-7287041_960_720.jpg";

  List posts = [
    {
      "username": "Iamsaurav",
      "profilePicture": imageSrc,
      "postUrl":
          "https://cdn.pixabay.com/photo/2022/06/29/13/25/birds-7291761_960_720.jpg"
    },
    {
      "username": "Iamsuprim",
      "profilePicture": imageSrc,
      "postUrl":
          "https://cdn.pixabay.com/photo/2022/07/06/17/52/window-7305702_960_720.jpg"
    },
    {
      "username": "IamPrijesh",
      "profilePicture": imageSrc,
      "postUrl":
          "https://cdn.pixabay.com/photo/2022/07/31/20/32/volkswagen-7356817_960_720.jpg"
    },
    {
      "username": "IamPrijesh",
      "profilePicture": imageSrc,
      "postUrl":
          "https://cdn.pixabay.com/photo/2022/07/31/20/32/volkswagen-7356817_960_720.jpg"
    }
  ];

  Widget buildNormalListView() {
    return ListView(children: [
      IgPost(
        postData: posts[0],
      ),
      IgPost(
        postData: posts[0],
      ),
      IgPost(
        postData: posts[0],
      ),
      IgPost(
        postData: posts[0],
      ),
      IgPost(
        postData: posts[0],
      ),
      IgPost(
        postData: posts[0],
      ),
      IgPost(
        postData: posts[0],
      ),
    ]);
  }

  Widget listViewBuilder() {
    return ListView.builder(
//// common properties

      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),

      padding: EdgeInsets.symmetric(horizontal: 15),

////
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final singlePost = posts[index]; // 0,1,2 .. posts[3]

        return IgPost(postData: singlePost);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: listViewBuilder(),
    ));
  }
}

// to make content scrollable use:
/// 1. SingleChildScrollView : simplest to use
/// 2. ListView : ListView.builder, ListView.separated
/// 3. GridView: GridView.builder, Gridview.count
/// 4. PageView: PageView.builder
/// 5. CustomScrollView, NestedScrollView (not covered in this course)


// SafeArea