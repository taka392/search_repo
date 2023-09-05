import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/presentation/router/go_router.dart';
import 'package:search_repo/presentation/theme/darck_them.dart';
import 'package:search_repo/presentation/theme/light_them.dart';


/// アプリ本体
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      theme: lightTheme, // ライト用テーマ
      darkTheme: darkTheme, // ダーク用テーマ
      themeMode: ThemeMode.system,
      builder: DevicePreview.appBuilder, // DevicePreview
      routerDelegate: router.routerDelegate, // GoRouter
      routeInformationParser: router.routeInformationParser, // GoRouter
      routeInformationProvider: router.routeInformationProvider, // GoRouter
      debugShowCheckedModeBanner: false,
    );
  }
}
