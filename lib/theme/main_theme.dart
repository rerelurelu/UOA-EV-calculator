import 'package:flutter/material.dart';

final ThemeData hinataTheme = ThemeData(
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
