import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_data.dart';

class ThemeChangeNotifier with ChangeNotifier {
  final SharedPreferences _prefs;

  ThemeChangeNotifier(this._prefs) {
    selectedTheme();
  }

  ThemeData _selectedTheme = defaultTheme;
  ThemeData get getSelectedTheme => _selectedTheme;

  void selectedTheme() async {
    _selectedTheme = _prefs.getInt();
  }
}
