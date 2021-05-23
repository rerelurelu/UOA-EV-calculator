import 'package:flutter/material.dart';

import './view/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ユニエア 期待値計算機',
      theme: ThemeData.light(),
      home: MainPage(),
    );
  }
}
