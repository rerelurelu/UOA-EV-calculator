import 'package:flutter/material.dart';

import '../theme/theme_data.dart';

enum MyThemeMode {
  defaultTheme,
  sakuraTheme,
  hinataTheme,
}

extension Extension on MyThemeMode {
  int get id {
    switch (this) {
      case MyThemeMode.defaultTheme:
        return 1000;
      case MyThemeMode.sakuraTheme:
        return 1001;
      case MyThemeMode.hinataTheme:
        return 1002;
    }
  }

  String get name {
    switch (this) {
      case MyThemeMode.defaultTheme:
        return 'デフォルト';
      case MyThemeMode.sakuraTheme:
        return '桜色';
      case MyThemeMode.hinataTheme:
        return '空色';
    }
  }

  ThemeData get themeData {
    switch (this) {
      case MyThemeMode.defaultTheme:
        return defaultTheme;
      case MyThemeMode.sakuraTheme:
        return sakuraTheme;
      case MyThemeMode.hinataTheme:
        return hinataTheme;
    }
  }
}
