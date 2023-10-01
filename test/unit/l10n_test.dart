import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/presentation/pages/init_page.dart';

import '../fake/http_mocks.dart';
import '../fake/mock_data.dart';

//
void main() {
  group('多言語変換テスト', () {
    testWidgets('英語への変換テスト', (WidgetTester tester) async {
      const data = MockData.jsonMock;
      final mockClient = MockClient();
      //空文字を送信するとリクエストはせず、エラーメッセージを表示する
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response(data, 200));
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            httpClientProvider.overrideWithValue(mockClient),
          ],
          child: const MaterialApp(
            localizationsDelegates: [
              // ここで AppLocalizations.delegate を追加
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              // 英語と日本語をサポートしています。
              Locale('en'), // English
              Locale('ja'), // 日本語
            ],
            locale: Locale('en'),
            // GoRouter
            debugShowCheckedModeBanner: false,
            home: InitPage(),
          ),
        ),
      );
      await tester.pump();
      expect(find.text('Please enter a repository name'), findsOneWidget);
      await tester.pump();
      expect(find.text('searching'), findsOneWidget);
    });
    testWidgets('日本語への変換テスト', (WidgetTester tester) async {
      const data = MockData.jsonMock;
      final mockClient = MockClient();
      //空文字を送信するとリクエストはせず、エラーメッセージを表示する
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response(data, 200));
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            httpClientProvider.overrideWithValue(mockClient),
          ],
          child: const MaterialApp(
            localizationsDelegates: [
              // ここで AppLocalizations.delegate を追加
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              // 英語と日本語をサポートしています。
              Locale('en'), // English
              Locale('ja'), // 日本語
            ],
            locale: Locale('ja'),
            // GoRouter
            debugShowCheckedModeBanner: false,
            home: InitPage(),
          ),
        ),
      );
      await tester.pump();
      expect(find.text('リポジトリ名を入力してください'), findsOneWidget);
      await tester.pump();
      expect(find.text('検索中'), findsOneWidget);
    });
  });
}
