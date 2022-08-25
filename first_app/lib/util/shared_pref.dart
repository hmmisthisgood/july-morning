import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const _isLoggedIn = "has_user_logged_in";

  static Future<bool> getHasUserLoggedIn() async {
    final instance = await SharedPreferences.getInstance();
    final value = instance.getBool(_isLoggedIn);
    return value ?? false;
  }

  static setHasUserLoggedIn(bool value) async {
    final instance = await SharedPreferences.getInstance();
    instance.setBool(_isLoggedIn, value);
  }

  static clear() async {
    final instance = await SharedPreferences.getInstance();
    instance.remove(_isLoggedIn);
  }
}
