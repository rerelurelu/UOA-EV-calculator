import 'package:flutter/material.dart';

import '../theme/backgroud_data.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          height: _height,
          width: _width,
          decoration: hinataColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 240,
                ),
                Text('Settings'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.home,
          color: Color.fromRGBO(0, 0, 0, .3),
        ),
        mini: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
