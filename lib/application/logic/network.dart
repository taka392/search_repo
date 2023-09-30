import 'package:connectivity/connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkConnectivity = Provider<ConnectivityResult>((ref) {
  final asyncValue = ref.watch(asyncConnectivity);
  if (asyncValue.value != null) {
    return asyncValue.value!;
  }
  return ConnectivityResult.none; // デフォルト値を設定（接続が確認できない場合）
});

final asyncConnectivity = FutureProvider<ConnectivityResult>((ref) async {
  final connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult;
});
