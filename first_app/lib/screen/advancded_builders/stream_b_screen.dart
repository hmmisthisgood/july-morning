import 'dart:async';

import 'package:flutter/material.dart';

class StreamBScreen extends StatefulWidget {
  const StreamBScreen({Key? key}) : super(key: key);

  @override
  State<StreamBScreen> createState() => _StreamBScreenState();
}

class _StreamBScreenState extends State<StreamBScreen> {
  StreamController<int> timerController = StreamController<int>.broadcast();
  int count = 1;

  @override
  void initState() {
    super.initState();
    addDataToStream();
    listenStream();
  }

  addDataToStream() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      count = count + 1;
      timerController.add(count);
      if (count == 20) {
        timer.cancel();
        timerController.close();
      }
    });
  }

  listenStream() {
    timerController.stream.listen(
      (data) {
        print("data is stream listen: $data");
      },
      onError: (e) {},
      onDone: () {},
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    timerController.close();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txt = theme.textTheme;
    print("build");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count = count + 1;
          print(count);
          timerController.add(count);
          // timerController.addError(error);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pressed this button',
              style: txt.headline1!.copyWith(fontSize: 24, color: Colors.black),
            ),
            StreamBuilder<int>(
              initialData: 0,
              stream: timerController.stream,
              builder: (context, val) {
                print(val.data);
                print(val.connectionState);
                if (val.hasData) {
                  return Text(
                    val.data.toString(),
                    style: txt.headline1!
                        .copyWith(fontSize: 50, color: Colors.red),
                  );
                }
                return Container();
              },
            ),
            Text(
              "times",
              style: txt.headline1!.copyWith(fontSize: 50, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
/// StreamBuilder
/// Stream: 
/// |--- Source
/// |---- Sink

//// ConnectionState: waiting, done, 