import 'package:url_launcher/url_launcher.dart';

/// アプリの初期準備をする
class DetailUsecase {
  DetailUsecase({
    required this.url,
  });

  final String url;

  /// 一連の流れをまとめて実施する
  Future<void> detail() async {
    //Urlを受け取る
    final Uri uri = Uri.parse(url); // String を Uri に変換
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
