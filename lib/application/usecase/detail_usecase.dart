import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// アプリの初期準備をする
class DetailUsecase {
  DetailUsecase({
    required this.url,
  });

  final String url;

  @visibleForTesting
  static final noHitKey = UniqueKey();

  /// 一連の流れをまとめて実施する
  Future<void> detail() async {
    //Urlを受け取る
    final Uri uri = Uri.parse(url); // String を Uri に変換
    if (await launchUrl(uri)) {
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
