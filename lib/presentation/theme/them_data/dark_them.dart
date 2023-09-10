import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/presentation/theme/color.dart';

final themeDataProvider = Provider<ThemeData>((ref) => darkTheme);

ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: CustomColor.black2,

    //appbar theme
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: CustomColor.black2,
    ),

    //textField theme
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: CustomColor.white1,
      suffixIconColor: CustomColor.white1,
      fillColor: CustomColor.gray1,
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
      color: CustomColor.white1,
      thickness: 0.5,
    ),
    iconTheme: const IconThemeData(
      color: CustomColor.white1,
      size: 15.0,
    ),

);
