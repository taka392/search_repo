import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final int maxLine;

  const CustomTextWidget(
      {super.key,
      required this.text,
      required this.textStyle,
      required this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}
