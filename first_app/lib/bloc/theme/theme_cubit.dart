import 'package:first_app/util/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  toogleTheme(bool isCurrentlyDarkTheme) {
    if (isCurrentlyDarkTheme) {
      emit(ThemeMode.light);

      SharedPref.setTheme("light");
    } else {
      emit(ThemeMode.dark);
      SharedPref.setTheme("dark");
    }
  }

  fetchInitialTheme() async {
    final String? theme = await SharedPref.getTheme();
    if (theme == null) {
      emit(ThemeMode.system);
    }

    if (theme == "light") {
      emit(ThemeMode.light);
    }
    if (theme == "dark") {
      emit(ThemeMode.dark);
    }
  }

  setTheme(ThemeMode mode) {}
}
