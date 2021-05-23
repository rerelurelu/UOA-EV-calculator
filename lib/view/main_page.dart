import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class MainPage extends StatelessWidget {
  final FocusNode _textNode1 = FocusNode();
  final FocusNode _textNode2 = FocusNode();
  final FocusNode _textNode3 = FocusNode();
  final FocusNode _textNode4 = FocusNode();

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
      body: KeyboardActions(
        config: _keyboardActionConfig,
        tapOutsideToDismiss: true,
        child: Center(
          child: Column(
            children: [
              Text(
                '期待値: 0.0%',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '○秒おきに',
                  ),
                  focusNode: _textNode1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '○％の確率で',
                  ),
                  focusNode: _textNode2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '○秒間',
                  ),
                  focusNode: _textNode3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'スコア○％アップ',
                  ),
                  focusNode: _textNode4,
                ),
              ),
            ],
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
}
