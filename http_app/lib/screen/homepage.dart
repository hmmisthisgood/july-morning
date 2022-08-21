import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
  }

  fetchDataFromServer() {
    final serverLocation = "https://www.server.com";

    final uri = Uri.parse(serverLocation);

// GET
    print("1. fetching value from server");
    var response = http.get(uri);
    response.then((value) {});
    response.catchError((e) {});
    print("2:");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
