import 'package:flutter/material.dart';

/* Theme Style */
final ThemeData defaultTheme = ThemeData().copyWith(
  scaffoldBackgroundColor: Colors.teal.shade200,
);

final ThemeData sakuraTheme = ThemeData().copyWith(
  scaffoldBackgroundColor: Colors.pink.shade200,
);

final ThemeData hinataTheme = ThemeData().copyWith(
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

/* Theme data  */
enum ThemeMode {
  defaultTheme,
  sakuraTheme,
  hinataTheme,
}

extension MyThemeMode on ThemeMode {
  static final id = {
    defaultTheme: 0,
    sakuraTheme: 1,
    hinataTheme: 2,
  };

  int? get getId => id[this];

  static final name = {
    defaultTheme: 'デフォルト',
    sakuraTheme: '桜色',
    hinataTheme: '空色',
  };

  String? get getName => name[this];

  static final theme = {
    defaultTheme: defaultTheme,
    sakuraTheme: sakuraTheme,
    hinataTheme: hinataTheme,
  };

  ThemeData? get getTheme => theme[this];

  static final backgroud = {
    defaultTheme: defaultTheme,
    sakuraTheme: sakuraTheme,
    hinataTheme: hinataTheme,
  };
}
