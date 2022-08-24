import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/post.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    fetchDataFromServer();
  }

  String bodyText = "this is body";
  List<Post> posts = [];

  fetchDataFromServer() async {
    print("fetching data from server");

    final serverLocation = "https://jsonplaceholder.typicode.com/posts";

    final uri = Uri.parse(serverLocation);

    print("server url is $serverLocation");
// GET
    print("1. fetching value from server");
    var response = http.get(uri);
    response.then((res) {
      print(res.statusCode);
      bodyText = res.body;

      final List decoded = json.decode(res.body);

      // posts = decoded;

      posts =
          decoded.map<Post>((item) => Post.convertJsonToPost(item)).toList();

      // posts = decoded.map<Post>((item) {
      //   final convertedItem = Post.convertJsonToPost(item);
      //   return convertedItem;
      // }).toList();

      print("body text is-----------:$bodyText");
      setState(() {});
    });
    response.catchError((e) {
      print(e);
    });

    try {
      var response2 = await http.get(uri);
      print(response2.statusCode);
    } catch (e) {
      print(e);
    }
    print("2:");
  }

  /// status cod:
  /// 200-299: success status code .
  /// Most common: 200: success

  /// 300-399:

  /// 400-499: error codes
  /// 400: bad request
  /// 401: Un authenticated
  /// 403: Un authroized
  /// 404: resource not found

  /// 500~ : server error
  ///  502: bad gateway
  /// 503:internal server error

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final Post _post = posts[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${index + 1}. " + _post.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(_post.body),
                        // Divider()
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
