main() {
  List<String> names = ['Jack', "Ram", "Jessica", "Jeff"];

// for
  int count = 0;
  for (count; count < names.length;) {
    print("this is the count: $count");
    String name = names[count];
    count = count + 1;
  }

  for (int i = 10; i > 0; i--) {
    if (i == 10) {
      continue;
    }

    print("$i");

    if (i == 5) {
      break;
    }
  }

  print("out of loop");

  /// for... in
  /// for each

  for (String name in names) {
    print(" for in : My name is : $name  ");
  }

  names.forEach(
    (value) {
      print("My name is : $value");
    },
  );

// while

  int whileCount = 0;

  while (whileCount < 5) {
    print(" running");
    whileCount++;
  }

  print("I am printing this");
// do while
  int doCount = 0;

  do {
    ///

    print("running do while: $doCount");
    doCount++;
  } while (doCount < 5);
}

// break , continue
