main() {
  var discount = 10; // implicit type
  // discount = "15";

  discount = 10;

/*
this is multi line comment
*/

  int age = 30; // explicit type setting
  // age = 'thirty';
  age = 100;

  double price = 999.99;
  price = 100;
  print("The amount is ${price}");

  num amount = 100;
  amount = 199.0;

  String name = "Jack";

  bool isSunday = false;

  dynamic anything = 1000;

  print(anything);

  // anything = "this is anything";

  print(anything);

  anything = 100 + anything;
  print(anything);

  anything = false;
  print(anything);

  const gravity = 9.8;
  const pii = 3.141528;
  // gravity = 9.8;

  final currentTime = DateTime.now();
  print(currentTime.toLocal());
}

/// Built in data types
/// int , bool , double, num, String, dynamic


/// List, Set , Map

/// Keywords: var, final, const 