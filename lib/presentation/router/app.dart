import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/state/them_model.dart';
import 'package:search_repo/presentation/router/go_router.dart';
import 'package:search_repo/presentation/theme/theme_data/dark_them.dart';
import 'package:search_repo/presentation/theme/theme_data/light_them.dart';

/// アプリ本体
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final themMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      //多言語対応のための記述
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        //英語と日本語をサポートしています。
        Locale('en'), // English
        Locale('ja'), // 日本語
      ],
      locale: DevicePreview.locale(context),
      //多言語対応のための記述
      theme: lightTheme,
      // ライト用テーマ
      darkTheme: darkTheme,
      // ダーク用テーマ
      themeMode: themMode,
      //システムデータでthemのテーマが変更されます。
      builder: DevicePreview.appBuilder,
      // DevicePreview
      routerDelegate: router.routerDelegate,
      // GoRouter
      routeInformationParser: router.routeInformationParser,
      // GoRouter
      routeInformationProvider: router.routeInformationProvider,
      // GoRouter
      debugShowCheckedModeBanner: false,
    );
  }
}
