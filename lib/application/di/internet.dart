import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/application/interfaces/internet.dart';
import 'package:search_repo/infrastructure/internet.dart';

//ネットワーク接続を確認するインスタンスを取得
final internetProvider = Provider<Internet>((ref) {
  return InternetImpl();
});
