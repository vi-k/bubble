import 'package:flutter_test/flutter_test.dart';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

void main() {
  test('create a bubble', () {
    Bubble(
      child: Text('test')
    );
//    expect(calculator.addOne(2), 3);
//    expect(calculator.addOne(-7), -6);
//    expect(calculator.addOne(0), 1);
//    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
