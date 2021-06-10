import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../model/calculate_model.dart';
import '../theme/theme_data.dart';

final expectedValueProvider = ChangeNotifierProvider(
  (ref) => CalculateModel(),
);

class MainPage extends StatelessWidget {
  final double _btnHeight = 50.0;
  final double _btnWidth = 100.0;
  final double _btnFontSize = 16.0;
  final double _formVertical = 12.0;
  final double _formHorizontal = 30.0;
  final Color _textColor = Color(0xff577979);
  final Color _formTextColor = Color(0xff8a8a8a);
  final double _formFontSize = 18.0;

  final FocusNode _textNode1 = FocusNode();
  final FocusNode _textNode2 = FocusNode();
  final FocusNode _textNode3 = FocusNode();
  final FocusNode _textNode4 = FocusNode();

  final TextEditingController incrController = TextEditingController();
  final TextEditingController probController = TextEditingController();
  final TextEditingController intervalController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: defaultColor,
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
                            watch(expectedValueProvider).getExvalue + '％',
                            style: TextStyle(
                              color: Color(0xff738c8c),
                              fontSize: 32,
                            ),
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: 32),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: _formVertical,
                        horizontal: _formHorizontal,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '○秒おきに',
                        ),
                        focusNode: _textNode1,
                        controller: intervalController,
                        style: TextStyle(
                          color: _formTextColor,
                          fontSize: _formFontSize,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: _formVertical,
                        horizontal: _formHorizontal,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '○％の確率で',
                        ),
                        focusNode: _textNode2,
                        controller: probController,
                        style: TextStyle(
                          color: _formTextColor,
                          fontSize: _formFontSize,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: _formVertical,
                        horizontal: _formHorizontal,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '○秒間',
                        ),
                        focusNode: _textNode3,
                        controller: timeController,
                        style: TextStyle(
                          color: _formTextColor,
                          fontSize: _formFontSize,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: _formVertical,
                        horizontal: _formHorizontal,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'スコア○％アップ',
                        ),
                        focusNode: _textNode4,
                        controller: incrController,
                        style: TextStyle(
                          color: _formTextColor,
                          fontSize: _formFontSize,
                        ),
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
                            height: _btnHeight,
                            width: _btnWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromRGBO(255, 255, 255, .5),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                clearText();
                                context.read(expectedValueProvider).resetValue();
                              },
                              child: Text(
                                'リセット',
                                style: TextStyle(
                                  fontSize: _btnFontSize,
                                  color: _textColor,
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
                            height: _btnHeight,
                            width: _btnWidth,
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
                                  fontSize: _btnFontSize,
                                  color: _textColor,
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
