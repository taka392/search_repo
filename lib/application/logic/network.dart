import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkProvider = Provider<Network>((ref) {
  return Network();
});

class Network {
  Future<bool> check() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      debugPrint("ネットに接続失敗");
      return true;
    } else {
      // ネットに接続されている時
      debugPrint("ネットに接続成功");
      return false;
    }
  }
}
