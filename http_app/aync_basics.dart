import 'package:http/http.dart' as http;

main() {
  int c = 10 + 10;

  int d = c + 10;

  print("1.Not dealyed");

  // delay();
  getDataFromserver();
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
getDataFromserver() {
  print("2. fetching value from server");
  final serverLocation = "https://www.google.com/awegawegaweg";

  final uri = Uri.parse(serverLocation);

  var response = http.get(uri);

  response.then((value) {
    print(value);
  });
  response.catchError((e) {
    print("e");
  });
  print("2:");
}
