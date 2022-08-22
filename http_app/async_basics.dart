import 'package:http/http.dart' as http;

main() async {
  int c = 10 + 10;

  int d = c + 10;

  print("1.Not dealyed");

  // delay();
  await getDataFromserver();

  print("4. end of main");
}

delay() {
  print("2. Starting delay");
  Future.delayed(
    Duration(seconds: 3),
    () {
      print("2.this is delayed");
    },
  );

  print("3 . delay complate");
}

/// async, await
/// Future, then , catchError
///

getDataFromserver() async {
  print("2. fetching value from server");

  final serverLocation = "https://www.google.com/awegawegaweg";

  final uri = Uri.parse(serverLocation);

  http.get(uri).then((res) {
    print(res.statusCode);
  }).catchError((e) {});

  // print("thhe status code is:" + response.statusCode.toString());

  // response.then((value) {
  //   print(value);
  // });
  // response.catchError((e) {
  //   print("e");
  // });
  print("2:");
}

getDataWithAwait() async {
  print("2. fetching value from server");

  final serverLocation = "https://www.google.com/awegawegaweg";

  final uri = Uri.parse(serverLocation);

  try {
    final response = await http.get(uri);
    print("thhe status code is:" + response.statusCode.toString());
    throw CustomException(message: "thsi is an exception");
  } catch (e) {
    print(e);
  }

  print("2:");
}
// throw , try,catch , finally

class CustomException implements Exception {
  String message;
  CustomException({required this.message});
  @override
  String toString() {
    return super.toString();
  }
}
