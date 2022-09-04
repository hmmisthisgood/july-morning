import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:http/http.dart' as http;

import '../model/post.dart';
import '../widget/posts_list_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = false;
  bool hasErrorOccurred = false;
  String errorMessage = '';

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

    isLoading = true;
    setState(() {});

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
      isLoading = false;
      setState(() {});
    });
    response.catchError((e) {
      isLoading = false;
      hasErrorOccurred = true;
      errorMessage = e.toString();

      setState(() {});
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

  postSomethingToServer() async {
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    final response = await http.post(uri, body: {
      "email": "email",
      "password": "password"
    }, headers: {
      "accpet": "application/json",
    });

    print(response.statusCode);
    print(response.body);
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

  Widget buildBody() {
    if (isLoading) {
      return CircularProgressIndicator();
    }

    if (hasErrorOccurred) {
      return Text(errorMessage);
    }
    return PostListWidget(
      posts: posts,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        postSomethingToServer();
      }),
      body: Center(child: buildBody()),
    );
  }
}


/// CircularProgressIndicator 
/// LinearProgresssIndicator