import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/domain/types/repo/repo_model.dart';
import 'package:search_repo/presentation/pages/list_page.dart';
import 'package:http/http.dart' as http;
import 'package:search_repo/presentation/widget/custom_animation.dart';
import '../http_mocks.dart';
import '../mock_data.dart';

///エラが発生した際に、適切なUIが表示されるかのテスト
void main() {
  group('Error,Loading,Emptyのテスト', () {
    testWidgets('Errorのテスト', (WidgetTester tester) async {
      const data = MockData.jsonMock;
      final mockClient = MockClient();
      //空文字を送信するとリクエストはせず、エラーメッセージを表示する
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response(data, 404));
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            httpClientProvider.overrideWithValue(mockClient),
            watchRepoProvider.overrideWithValue(AsyncValue.error(
                "エラーメッセージ", StackTrace.fromString('Fake stack trace'))),
          ],
          child: const MaterialApp(
            home: ListPage(),
            // Other necessary configurations
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
      expect(find.byType(CustomAnimation), findsOneWidget);
      expect(find.byKey(ListPage.errorKey), findsOneWidget);
    });

    testWidgets('loadingのテスト', (WidgetTester tester) async {
      const data = MockData.jsonMock;
      final mockClient = MockClient();
      //空文字を送信するとリクエストはせず、エラーメッセージを表示する
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response(data, 200));
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            httpClientProvider.overrideWithValue(mockClient),
            watchRepoProvider.overrideWithValue(const AsyncValue.loading()),
          ],
          child: const MaterialApp(
            home: ListPage(),
            // Other necessary configurations
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
      expect(find.byKey(ListPage.loadingKey), findsOneWidget);
    });

    testWidgets('Emptyのテスト', (WidgetTester tester) async {
      const data = MockData.jsonMock;
      final mockClient = MockClient();
      //空文字を送信するとリクエストはせず、エラーメッセージを表示する
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response(data, 200));
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            httpClientProvider.overrideWithValue(mockClient),
            watchRepoProvider.overrideWithValue(const AsyncData(RepoModel(
              items: [],
              totalCount: 0,
            ))),
          ],
          child: const MaterialApp(
            home: ListPage(),
            // Other necessary configurations
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
      expect(find.byKey(ListPage.noHitKey), findsOneWidget);
    });
  });
}
