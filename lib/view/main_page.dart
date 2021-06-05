import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../model/calculate_model.dart';

class MainPage extends StatelessWidget {
  final double btnHeight = 55.0;
  final double btnWidth = 200.0;

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
      appBar: NewGradientAppBar(
        title: Text('期待値計算機'),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(241, 157, 181, 1.0),
            Color.fromRGBO(124, 199, 232, 1.0),
          ],
        ),
      ),
      body: KeyboardActions(
        config: _keyboardActionConfig,
        tapOutsideToDismiss: false,
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 32),
                  Consumer(builder: (context, watch, child) {
                    return Text(
                      '期待値: ' + watch(expectedValueProvider).exvalue + '％',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40.0,
                      horizontal: 24.0,
                    ),
                    child: SizedBox(
                      height: btnHeight,
                      width: btnWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          int interval = int.parse(intervalController.value.text);
                          int prob = int.parse(probController.value.text);
                          int time = int.parse(timeController.value.text);
                          int incr = int.parse(incrController.value.text);
                          context.read(expectedValueProvider).calculate(interval, prob, time, incr);
                        },
                        child: Text(
                          '計算する',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo.shade200,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 24.0,
                    ),
                    child: SizedBox(
                      height: btnHeight,
                      width: btnWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          clearText();
                        },
                        child: Text(
                          '数値をリセット',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                ],
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
      keyboardSeparatorColor: Colors.grey,
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
