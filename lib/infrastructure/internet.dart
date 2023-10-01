import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:search_repo/application/interfaces/internet.dart';

class InternetImpl implements Internet {
  @override
  Future<bool> check() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      debugPrint("ネット接続失敗");
      return true;
    } else {
      // ネットに接続されている時
      debugPrint("ネット接続成功");
      return false;
    }
  }
}
