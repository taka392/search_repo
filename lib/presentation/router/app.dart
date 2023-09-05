import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/presentation/router/go_router.dart';
import 'package:search_repo/presentation/theme/them_data/dark_them.dart';
import 'package:search_repo/presentation/theme/them_data/light_them.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// アプリ本体
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      //多言語対応のための記述
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ja'),
      ],
      //ここまで〜
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
