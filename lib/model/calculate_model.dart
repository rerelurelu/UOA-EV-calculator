import 'package:flutter/material.dart';

class CalculateModel extends ChangeNotifier {
  String expectedValue = '0.00';
  String get exvalue => expectedValue;

  void calculate(int interval, int prob, int time, int incr) {
    /**
     * incr -> スコア○％アップ
     * prob -> ○％の確率で
     * interval -> ○秒おきに
     * time -> ○秒間
     **/
    double result = incr *
        (prob / 100 * time) /
        ((interval + time) * prob / 100 + interval * (1 - prob / 100));

    expectedValue = result.toStringAsFixed(2);

    notifyListeners();
  }
}
