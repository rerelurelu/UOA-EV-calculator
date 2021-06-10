import 'package:flutter/material.dart';

/* Theme Color */
final ThemeData defaultTheme = ThemeData().copyWith(
  scaffoldBackgroundColor: Color(0xff7cc7e8),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff67b7b2),
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
    hintStyle: TextStyle(
      color: Color(0xff577979),
    ),
  ),
);

/* Background Color */
final BoxDecoration defaultColor = BoxDecoration().copyWith(
  gradient: LinearGradient(
    colors: [
      Color(0xffCFD6E6),
      Color(0xffE7EFF9),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.bottomRight,
  ),
);
