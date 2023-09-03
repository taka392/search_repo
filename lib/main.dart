import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/application/state/page/page.dart';

import 'package:search_repo/presentation/router/app.dart';


void main() async {
  // インスタンスを非同期で取得
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  //初期化処理
  final page = container.read(pageNotifierProvider.notifier);
  page.refresh();
  const app = App();
  const scope = ProviderScope(
    overrides: [],
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


