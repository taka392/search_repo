import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'http_mocks.dart';
import 'mock_data.dart';

class TestWidget {
  final Override? override1;
  final Override? override2;
  final Override? override3;
  final MockClient? mockClient;
  final int status;
  final Locale locale;
  final Widget widget;

  TestWidget({
    this.override1,
    this.override2,
    this.override3,
    this.mockClient,
    required this.status,
    required this.locale,
    required this.widget,
  });

  Future<void> pumpWidget(WidgetTester tester) async {
    const data = MockData.jsonMock;
    //空文字を送信するとリクエストはせず、エラーメッセージを表示する

    if (mockClient != null) {
      when(mockClient!.get(any))
          .thenAnswer((_) async => http.Response(data, status));
    }
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (override1 != null) override1!,
          if (override2 != null) override2!,
          if (override3 != null) override3!,
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('ja'), // 日本語
          ],
          locale: locale,
          home: widget,
          // Other necessary configurations
        ),
      ),
    );
  }
}
