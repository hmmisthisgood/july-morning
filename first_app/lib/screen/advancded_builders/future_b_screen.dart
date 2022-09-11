import 'package:flutter/material.dart';

class FutureBScreen extends StatefulWidget {
  const FutureBScreen({Key? key}) : super(key: key);

  @override
  State<FutureBScreen> createState() => _FutureBScreenState();
}

class _FutureBScreenState extends State<FutureBScreen> {
  @override
  void initState() {
    super.initState();
    getdataFromSErver();
  }

  Future<List<int>> getdataFromSErver() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    return List.generate(10, (index) => index + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<int>>(
            future: getdataFromSErver(),
            builder: (context, val) {
              print(val.connectionState);
              print(val.data);
              val.data;

              // if (val.connectionState == ConnectionState.waiting) {
              //   return Text("waiting");
              // }
              // if (val.connectionState == ConnectionState.none) {
              //   return Text("none");
              // }
              // if (val.connectionState == ConnectionState.active) {
              //   return Text("active");
              // }

              if (val.connectionState != ConnectionState.done) {
                return CircularProgressIndicator();
              }
              if (val.connectionState == ConnectionState.done) {}
              return ListView.builder(
                itemCount: val.data!.length,
                itemBuilder: (context, index) {
                  return Text(
                    val.data![index].toString(),
                    style: TextStyle(fontSize: 30),
                  );
                },
              );
            }),
      ),
    );
  }
}
