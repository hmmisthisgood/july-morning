import 'package:first_app/screen/stful/bottom_nav_screen.dart';
import 'package:first_app/util/shared_pref.dart';
import 'package:flutter/material.dart';

import '../../navigation/routes.dart';
import '../bloc_screens/posts_screen_with_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatusAndNavigate();
  }

  checkLoginStatusAndNavigate() async {
    final bool isLoggedIn = await SharedPref.getHasUserLoggedIn();

    Future.delayed(Duration(milliseconds: 1500), () {
      if (isLoggedIn == false) {
        Navigator.pushReplacementNamed(
          context,
          Routes.login,
        );
        return;
      }

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => PostScreenWithBloc()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.car_rental),
      ),
    );
  }
}
