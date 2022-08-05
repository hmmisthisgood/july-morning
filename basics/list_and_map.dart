main() {
  /// implicit declaration and definition of list
  List students = ["jeff", "jack", "jessica"];

  /// explicit definition of list, but dynamic
  List values = [];

  /// explicit declaration and defintion of list with int type
  List<int> marks = [1, 2, 2, 3, 4, 4, 4, 4, 4, 5, 56];
  /////////////index: 0,1,2,3,4,....

  final lastItem = marks[4];
  final fistItem = marks[0];

  print("last item is : $lastItem");
  print("first item is : $fistItem");

  marks.add(1000);
  print(marks);

  marks.insert(0, -11);
  print(marks);

  Set rollNo = {1, 1, 1, 2, 2};
  print("set is: " + rollNo.toString());

  // Map
  Map<String, dynamic> person = {
    "profilePicture": "https://a.jpg", // MapEntry
    "age": 111,
    "name": "Ram",
    "1": 1,
    "1000.0": "this is value"
  };

  final name = person["name"];
  final pp = person["profilePicture"];
  person["address"] = "kathmandu";

  /// Map = data type
  //// map function available in both List , Set & Map

  // map function in a Map person
  var someMap = person.map(
    (key, value) {
      print("Key is : $key & value is $value");
      return MapEntry(key, value);
    },
  );

  /// map function in a List students
  final modifiedStundents = students.map(
    (item) {
      var temp = "My name is $item";
      return temp;
    },
  );

  print(modifiedStundents);
}
