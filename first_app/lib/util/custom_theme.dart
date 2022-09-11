import 'package:flutter/material.dart';

class CustomTheme {
  static const Color darkBgColor = Color(0xff243447);
  static const darkTextColor = Colors.white;

  static const Color lightBgColor = Colors.white;
  static const lightTextColor = Colors.black;

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: lightBgColor,
    iconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black,
    fontFamily: "Rubik",
    textTheme: TextTheme(
      bodyText2: TextStyle(color: lightTextColor, fontSize: 10),
      bodyText1: TextStyle(color: lightTextColor, fontSize: 12),
      headline6: TextStyle(color: lightTextColor, fontSize: 14),
      headline5: TextStyle(color: lightTextColor, fontSize: 16),
      headline4: TextStyle(color: lightTextColor, fontSize: 18),
      headline3: TextStyle(color: lightTextColor, fontSize: 20),
      headline2: TextStyle(color: lightTextColor, fontSize: 22),
      headline1: TextStyle(
          color: lightTextColor, fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: darkBgColor,
    iconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white,
    fontFamily: "Rubik",
    textTheme: TextTheme(
      bodyText2: TextStyle(color: darkTextColor, fontSize: 10),
      bodyText1: TextStyle(color: darkTextColor, fontSize: 12),
      headline6: TextStyle(color: darkTextColor, fontSize: 14),
      headline5: TextStyle(color: darkTextColor, fontSize: 16),
      headline4: TextStyle(color: darkTextColor, fontSize: 18),
      headline3: TextStyle(color: darkTextColor, fontSize: 20),
      headline2: TextStyle(color: darkTextColor, fontSize: 22),
      headline1: TextStyle(
          color: darkTextColor, fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );

  static bool isDarkTheme(Color currentBgColor) {
    if (currentBgColor == darkBgColor) {
      return true;
    }
    return false;
  }
}
