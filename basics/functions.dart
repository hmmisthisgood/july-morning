import 'dart:math';

main() {
  final area = areaCircle(radius: 50);
  print("area in main: $area");

  dummyFunction(
    e: true,
    a: 1100,
    b: 111,
    c: 1,
  );
}

num areaCircle({required num radius}) {
  final area = pi * radius * radius;
  print("area of circle: $area");
  return area;
}

dummyFunction(
    {required int a,
    required int b,
    required int c,
    required bool e,
    double? d}) {
  var data = c / a;
}
