import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final int? maxLine;
  final double? maxWidth;
  final TextAlign? textAlign;

  const CustomTextWidget({
    super.key,
    required this.text,
    required this.textStyle,
    this.maxLine,
    this.maxWidth,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
