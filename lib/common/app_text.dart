import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const AppText(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.textAlign,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          overflow: TextOverflow.fade,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight),
    );
  }
}
