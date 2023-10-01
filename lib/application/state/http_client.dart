import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

//テスト用にhttp.Client()をproviderで管理することにしました。
final httpClientProvider = Provider<http.Client>((ref) => http.Client());
