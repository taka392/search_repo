// ignore_for_file: avoid_classes_with_only_static_members, unnecessary_statements

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

class Network {
  static Future<bool> check() async {
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
