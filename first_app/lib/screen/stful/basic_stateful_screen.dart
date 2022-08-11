import 'dart:async';

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int currentCount = 0;

  @override
  void initState() {
    super.initState();

    // Timer( 1 minutes   , (){
    //   print("print this");
    // });

    // Timer.periodic( 1 sec , (timer){

    // });

    print("init called");
  }

  @override
  void didUpdateWidget(covariant CounterScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("did update");
  }

  @override
  void dispose() {
    super.dispose();

    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("build :: called");
    return Scaffold(
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
              onPressed: () {
                print("button pressed");
                currentCount++;
                print("current count is : $currentCount");

                setState(() {});
              },
              child: Icon(Icons.add)),
          FloatingActionButton(
            onPressed: () {
              currentCount--;
              print("current count is : $currentCount");

              setState(() {});
            },
            child: Icon(Icons.minimize),
          ),
        ],
      ),
      body: Center(
          child: Text(
        currentCount.toString(),
        style: TextStyle(fontSize: 32),
      )),
    );
  }
}
