import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './view/main_page.dart';
import 'theme/theme_data.dart';

void main() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  return runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ユニエア 期待値計算機',
          theme: hinataTheme,
          home: MainPage(),
        );
      },
    );
  }
}
