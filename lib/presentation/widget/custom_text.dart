import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final int? maxLine;
  final double? maxWidth; // 追加: テキストの横幅を指定

  const CustomTextWidget({
    super.key,
    required this.text,
    required this.textStyle,
    this.maxLine,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
  }
}
