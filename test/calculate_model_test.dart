import 'package:flutter_test/flutter_test.dart';

import 'package:uoa_ev_calculator/model/calculate_model.dart';

void main() {
  /* Calculation result */
  test('Result1', () {
    final caluculate = CalculateModel();
    caluculate.calculate(7, 28, 6, 19);
    var exvalue = caluculate.getExvalue;
    expect(exvalue, '3.68');
  });

  test('Result2', () {
    final caluculate = CalculateModel();
    caluculate.calculate(8, 16, 5, 19);
    var exvalue = caluculate.getExvalue;
    expect(exvalue, '1.73');
  });

  test('Result3', () {
    final caluculate = CalculateModel();
    caluculate.calculate(11, 11, 10, 12);
    var exvalue = caluculate.getExvalue;
    expect(exvalue, '1.09');
  });

  /* Reset Exvalue */
  test('Reset Exvalue', () {
    final caluculate = CalculateModel();
    caluculate.calculate(7, 28, 6, 19);
    caluculate.resetValue();
    var exvalue = caluculate.getExvalue;
    expect(exvalue, '0.00');
  });
}
