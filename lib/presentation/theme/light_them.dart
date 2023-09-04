import 'package:flutter/material.dart';
ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color(0xffFCFDF6),

  //appbar theme
  appBarTheme: const AppBarTheme(
    toolbarHeight: 9000,
    centerTitle: false,

    backgroundColor: Colors.green,
    elevation: 0,
    titleTextStyle: TextStyle(
      height: 900,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: Colors.green,
      size: 1000,
    ),
  ),

  //textField theme
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: const Color(0xff9e9e9e),
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