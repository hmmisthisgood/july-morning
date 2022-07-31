main() {
  /// if else

  String day = "tuesday";

  if (day == 'friday' || day == 'sunday')
    print("today is sunday or friday");
  else if (day == 'tuesday') {
    print("tuesday");
  } else if (day == 'wednesday') {
    print("wednesday");
  } else {
    print("not sunday");
  }

  switch (day) {
    case "sunday":
      print("sunday is boring");
      break; //returnday
    case "monday":
      print("sunday is boring");
      return;

    case "tuesday":
      print("sunday is boring");
      break;

    default:
      print("something else");
  }
}
