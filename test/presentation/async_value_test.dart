import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/presentation/pages/list_page.dart';
import 'package:http/http.dart' as http;
import 'package:search_repo/presentation/widget/custom_animation.dart';
import '../domain/mock_data.dart';
import '../infrastructure/http_server_test.mocks.dart';


void main() {

  group('AsyncValue型のエラーハンドリングテスト', () {

    testWidgets('errorのテスト', (WidgetTester tester) async {
      const data = MockData.jsonMock;
      final mockClient = MockClient();
      //空文字を送信するとリクエストはせず、エラーメッセージを表示する仕様
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response(data, 200));
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            httpClientProvider.overrideWithValue(mockClient),
          ],
          child: const MaterialApp(
            home: ListPage(),
            // Other necessary configurations
          ),
        ),
      );
      final container = ProviderContainer();
      final repo = container.read(repoProvider.notifier);
      repo.errorText();
      await tester.pump();
      await tester.pump();
      expect(find.byType(CustomAnimation), findsOneWidget);
      expect(find.text("エラー"), findsOneWidget);
      expect(find.byKey(ListPage.aaerrorKey), findsOneWidget);
    });

  testWidgets('Test loading behavior', (WidgetTester tester) async {
    const data = MockData.jsonMock;
    final mockClient = MockClient();
    //空文字を送信するとリクエストはせず、エラーメッセージを表示する仕様
    when(mockClient.get(any))
        .thenAnswer((_) async => http.Response(data, 200));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          httpClientProvider.overrideWithValue(mockClient),
        ],
        child: const MaterialApp(
          home: ListPage(),
          // Other necessary configurations
        ),
      ),
    );
    final container = ProviderContainer();
    final repo = container.read(repoProvider.notifier);
    repo.loadingText();
    await tester.pump();
    expect(find.byKey(ListPage.loadingKey), findsOneWidget);
  });

/*    testWidgets('data.totalCount == 0のテスト', (WidgetTester tester) async {
      final data = json.decode(MockData.noJsonData);
      final AsyncValue<RepoModel> repoData = AsyncValue.data(RepoModel.fromJson(data));
      final scrollController = ScrollController();
      final container = ProviderContainer();
      final locate = container.read(appLocalizationsProvider);
      await tester.pumpWidget(
        MaterialApp( // MaterialAppでDirectionalityを提供
          home: ProviderScope(
            overrides: const [],
            child: ListPage(repoData: repoData, scrollController: scrollController, locate: locate),
          ),
        ),
      )As
      await tester.pump();
      expect(find.byKey(ListPage.noHitKey), findsOneWidget);
    });*/

  });}

