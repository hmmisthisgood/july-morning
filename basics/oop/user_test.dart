import 'user.dart';

main() {
  User notRam = User(
    age: 11,
    username: "iamRamey",
    userType: "admin",
    bio: "this",
    pass: "anoteher password",
  );

  final pass = notRam.getPassword();
  notRam.setPassword("newStrong=password");

// with dart getter and setter
  final passwordFromGetter = notRam.password;
  notRam.password = "password from setter";

  print("password is:" + pass);
  print("password from setter is:" + notRam.password);
}
