import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign? align;

  const ReusableText({
    super.key,
    required this.text,
    required this.textStyle,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: align,
    );
  }
}
