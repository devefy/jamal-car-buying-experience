import 'package:flutter/material.dart';

extension DurationX on num {
  Duration get microseconds => Duration(microseconds: round());
  Duration get ms => (this * 1000).microseconds;
  Duration get sec => (this * 1000 * 1000).microseconds;
  Duration get min => (this * 1000 * 1000 * 60).microseconds;
}

extension BuildContextX on BuildContext {
  MediaQueryData get data => MediaQuery.of(this);
  Size get size => data.size;
  double get screenHeight => size.height;
  double get screenWidth => size.width;
  EdgeInsets get viewPadding => data.viewPadding;
  EdgeInsets get viewInsets => data.viewInsets;
}
