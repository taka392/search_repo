import 'package:flutter/material.dart';
import 'package:search_repo/presentation/theme/color.dart';
import 'package:search_repo/presentation/theme/fonts.dart';
ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color(0xffFCFDF6),

  //appbar theme
  appBarTheme: const AppBarTheme(
    centerTitle: false,
    backgroundColor: CustomColor.white1,
    titleTextStyle: CustomText.titleL,
  ),

  //textField theme
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: const Color.fromARGB(235, 52, 125,1),
    suffixIconColor: const Color(0xff9e9e9e),
    fillColor: const Color(0xffe1eedf),
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: Colors.transparent,

      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: Color(0xff9e9e9e),
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    isDense: true,
  ),

  // divider
  dividerColor: const Color(0x47000000),

  //RADIOボタンのアクティブ時の色
  radioTheme: RadioThemeData(
    fillColor:
    MaterialStateColor.resolveWith((states) => const Color(0xFFFF9800)),
  ),
);