import 'package:flutter/material.dart';
import 'package:search_repo/presentation/theme/color.dart';
import 'package:search_repo/presentation/theme/fonts.dart';
ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: CustomColor.white4,

  //appbar theme
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: false,
    backgroundColor: CustomColor.white4,
  ),

  //textField theme
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: CustomColor.black2,
    suffixIconColor: CustomColor.black2,
    fillColor: CustomColor.white5,
    filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
  ),
  // divider

  dividerTheme: const DividerThemeData(
    color: CustomColor.black3,
    thickness: 0.5,
  )
);