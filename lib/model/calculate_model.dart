import 'package:flutter/material.dart';

class CalculateModel extends ChangeNotifier {
  double expectedValue = 0.0;

  void calculateExpectedValue(int incr, int prob, int interval, int time) {
    expectedValue = (incr / 100) *
        (prob * time) /
        ((interval + time) * prob + interval * (1 - prob));
    notifyListeners();
  }
}
