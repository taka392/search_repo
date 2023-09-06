import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('リンク表示ウィジェット'),
        ),
        body: const Center(
          child: LinkWidget(
            text: 'OpenAI',
            url: 'https://www.openai.com',
          ),
        ),
      ),
    );
  }
}

class LinkWidget extends StatelessWidget {
  final String url;

  const LinkWidget({Key? key,  required this.url}) : super(key: key);

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url); // String を Uri に変換
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchUrl,
      child: Text(
        text,
        style: const TextStyle(
          decoration: TextDecoration.underline,
          color: Colors.blue,
        ),
      ),
    );
  }
}

