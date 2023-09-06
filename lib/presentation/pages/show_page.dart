import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ShowPage extends StatelessWidget {
  final String text;
  final String url;

  ShowPage({required this.text, required this.url});

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'URLを開けませんでした: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: Colors.blue,
        ),
      ),
    );
  }
}