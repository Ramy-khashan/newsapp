import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial());
  ThemeMode theme = ThemeMode.light;
  bool isDark = false;
  String themetype = "";
  saveTheme() {
    SharedPreferences.getInstance().then((value) {
      themetype = value.getString("theme").toString();
      theme = themetype == "dark" ? ThemeMode.dark : ThemeMode.light;
      isDark = themetype == "dark" ? true : false;
      emit(GetThemeModeState());
    });
  }

  changeTheme() async {
    isDark = !isDark;
    theme = isDark ? ThemeMode.dark : ThemeMode.light;
    await SharedPreferences.getInstance().then((value) {
      value.setString("theme", isDark ? "dark" : "light");
    });
    emit(ChangeThemeModeState());
  }
}
