import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowPage extends StatelessWidget {

  final String url;

  const ShowPage({super.key,  required this.url});

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'URLを開けませんでした: $url';
    }
  }
}
