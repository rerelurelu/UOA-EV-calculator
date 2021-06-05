import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../model/calculate_model.dart';

class MainPage extends StatelessWidget {
  final double btnHeight = 50.0;
  final double btnWidth = 100.0;
  final double btnFontSize = 16.0;
  final Color textColor = Color(0xff577979);
  final Color formTextColor = Colors.white;

  final FocusNode _textNode1 = FocusNode();
  final FocusNode _textNode2 = FocusNode();
  final FocusNode _textNode3 = FocusNode();
  final FocusNode _textNode4 = FocusNode();

  final TextEditingController incrController = TextEditingController();
  final TextEditingController probController = TextEditingController();
  final TextEditingController intervalController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  final expectedValueProvider = ChangeNotifierProvider(
    (ref) => CalculateModel(),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff7cc7e8),
              Color(0xffDDBDFC),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: KeyboardActions(
          config: _keyboardActionConfig,
          tapOutsideToDismiss: false,
          child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    Consumer(builder: (context, watch, child) {
                      return Container(
                        height: 80.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(255, 255, 255, .5),
                        ),
                        child: Center(
                          child: Text(
                            watch(expectedValueProvider).exvalue + '％',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 32,
                            ),
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 24.0,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '○秒おきに',
                        ),
                        focusNode: _textNode1,
                        controller: intervalController,
                        style: TextStyle(color: formTextColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 24.0,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '○％の確率で',
                        ),
                        focusNode: _textNode2,
                        controller: probController,
                        style: TextStyle(color: formTextColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 24.0,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '○秒間',
                        ),
                        focusNode: _textNode3,
                        controller: timeController,
                        style: TextStyle(color: formTextColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 24.0,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'スコア○％アップ',
                        ),
                        focusNode: _textNode4,
                        controller: incrController,
                        style: TextStyle(color: formTextColor),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 24.0,
                          ),
                          child: Container(
                            height: btnHeight,
                            width: btnWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromRGBO(255, 255, 255, .5),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                clearText();
                              },
                              child: Text(
                                'リセット',
                                style: TextStyle(
                                  fontSize: btnFontSize,
                                  color: textColor,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                elevation: 0.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 40.0,
                            horizontal: 24.0,
                          ),
                          child: Container(
                            height: btnHeight,
                            width: btnWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromRGBO(255, 255, 255, .5),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                int interval = int.parse(intervalController.value.text);
                                int prob = int.parse(probController.value.text);
                                int time = int.parse(timeController.value.text);
                                int incr = int.parse(incrController.value.text);
                                context
                                    .read(expectedValueProvider)
                                    .calculate(interval, prob, time, incr);
                              },
                              child: Text(
                                '計算する',
                                style: TextStyle(
                                  fontSize: btnFontSize,
                                  color: textColor,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                elevation: 0.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  get _keyboardActionConfig {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardSeparatorColor: Color.fromRGBO(255, 255, 255, .3),
      nextFocus: true,
      actions: [
        KeyboardActionsItem(focusNode: _textNode1),
        KeyboardActionsItem(focusNode: _textNode2),
        KeyboardActionsItem(focusNode: _textNode3),
        KeyboardActionsItem(focusNode: _textNode4),
      ],
    );
  }

  void clearText() {
    intervalController.clear();
    probController.clear();
    timeController.clear();
    incrController.clear();
  }
}
