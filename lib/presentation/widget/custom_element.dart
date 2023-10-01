import 'package:flutter/material.dart';

class CustomElement extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Icon icon;
  final Color color;
  final String title;

  const CustomElement({
    super.key,
    required this.text,
    required this.textStyle,
    required this.icon,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const SizedBox(
            width: 50,
          ),
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                child: Center(
                  child: icon,
                ),
              ),
              Text(title),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            text,
            style: textStyle,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
