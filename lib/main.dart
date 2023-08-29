import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:search_repo/presentation/router/app.dart';


void main() async {


  const app = App();
  const scope = ProviderScope(child: app);

  // Device Preview
  Widget window = scope;

  //Web上で実行されている時のみDevicePreview
  if (kIsWeb) {
    window = DevicePreview(
      builder: (context) => scope,
    );
  }
  runApp(window);
}


// プレゼンテーション層の実装


