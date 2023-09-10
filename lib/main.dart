import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/presentation/router/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const app = App();
  const scope = ProviderScope(
    overrides: [],
    child: app,
  );
  Widget window = scope;
  // Web上で実行されている時のみDevicePreviewを有効化
  if (kIsWeb) {
    window = DevicePreview(
      builder: (context) => scope,
    );
  }
  runApp(window);
}


