import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './view/main_page.dart';
import './model/calculate_model.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => CalculateModel(),
        child: MyApp(),
      ),
    );

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
