import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

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

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text('期待値計算機'),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(241, 157, 181, 1.0),
            Color.fromRGBO(124, 199, 232, 1.0),
          ],
        ),
      ),
      body: Center(
        child: Column(),
      ),
    );
  }
}
