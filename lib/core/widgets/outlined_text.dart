import 'package:flutter/material.dart';

class OutlinedText extends StatelessWidget {
  const OutlinedText(
    this.text, {
    super.key,
    this.style = const TextStyle(),
    required this.strokeColor,
    this.strokeWidth = 2,
  });
  final String text;
  final TextStyle style;
  final Color strokeColor;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        foreground: Paint()
          ..strokeWidth = strokeWidth
          ..color = strokeColor
          ..style = PaintingStyle.stroke,
      ),
    );
  }
}
