import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:uoa_ev_calculator/view/main_page.dart';

class NewInstall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;

    final paraOne = '''
      「ユニエア期待値計算機」はサポートを終了いたしました。
    ''';

    final paraTwo = '''
      本アプリの改良版である「ゆにつーる」をリリースいたしましたので、引き続きサービスを利用するためには以下の「App Storeを開く」ボタンからApp Storeを開き「ゆにつーる」を入手する必要があります。
    ''';

    final paraThree = '''
      「ユニエア期待値計算機」をご利用いただき、ありがとうございました。
    ''';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('お知らせ'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.close_rounded,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
            },
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: Center(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  paraOne,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 40),
                Text(
                  paraTwo,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 40),
                Text(
                  paraThree,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 50),
                Container(
                  height: 60,
                  width: 180,
                  child: ElevatedButton(
                    child: Text(
                      'App Storeを開く',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      LaunchReview.launch(writeReview: false, iOSAppId: '1579173655');
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
