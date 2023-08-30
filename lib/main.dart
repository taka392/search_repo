import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/infrastructure/repo/shared_preference.dart';

import 'package:search_repo/presentation/router/app.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  // インスタンスを非同期で取得
  final sharedPreferences = await SharedPreferences.getInstance();

  const app = App();
  final scope = ProviderScope(
    overrides: [
      // キャッシュしたインスタンスを提供
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
    child: app,
  );

  // Device Preview
  Widget window = scope;

  // Web上で実行されている時のみDevicePreviewを有効化
  if (kIsWeb) {
    window = DevicePreview(
      builder: (context) => scope,
    );
  }

  runApp(window);
}


// プレゼンテーション層の実装


