import 'package:flutter/material.dart';

class CalculateModel extends ChangeNotifier {
  double expectedValue = 0.00;

  void calculateExpectedValue(int incr, int prob, int interval, int time) {
    /**
     * incr -> スコア○％アップ
     * prob -> ○％の確率で
     * interval -> ○秒おきに
     * time -> ○秒間
     */
    expectedValue = (incr / 100) *
        (prob * time) /
        ((interval + time) * prob + interval * (1 - prob));
    notifyListeners();
  }
}
