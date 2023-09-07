import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/pages/list_page.dart';
import 'package:http/http.dart' as http;
import '../fake_repository.dart';
import '../infrastructure/http_server_test.mocks.dart';
import '../repo_provider.dart';


void main() {

/*  group('AsyncValue型のエラーハンドリングテスト', () {

    testWidgets('errorのテスト', (WidgetTester tester) async {
      final repoData = AsyncValue<RepoModel>.error('エラーが発生しました', StackTrace.fromString('疑似スタックトレース'));
      WidgetsFlutterBinding.ensureInitialized();
      final mockClient = MockClient();
      when(mockClient.get(any)).thenAnswer((_) async => http.Response('Not Found', 404));
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            repositoryProvider.overrideWithValue(FakeRepository(httpClient: mockClient)),
          ],
          child: const MaterialApp(home: ListPage()),
        ),
      );
      await tester.pump();
      expect(find.byKey(ListPage.errorKey), findsOneWidget);
    });*/


  testWidgets('Test loading behavior', (WidgetTester tester) async {
    // Create an instance of MockRepoProvider and set it to loading state
    final mockRepoProvider = MockRepoProvider.loading();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          repoProvider.overrideWithValue(mockRepoProvider),
        ],
        child: const MaterialApp(
          home: ListPage(), // Specify the widget to test the loading behavior
          // Other necessary configurations
        ),
      ),
    );

    // Add an assertion to verify the loading state within the widget
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

}

