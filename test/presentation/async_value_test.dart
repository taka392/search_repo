import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';
import 'package:search_repo/presentation/pages/list_page.dart';
import 'package:http/http.dart' as http;
import '../domain/mock_data.dart';
import '../fake_repository.dart';
import '../infrastructure/http_server_test.mocks.dart';
import '../loading_repository.dart';
void main() {

  group('AsyncValue型のエラーハンドリングテスト', () {

    testWidgets('errorのテスト', (WidgetTester tester) async {
      /*final repoData = AsyncValue<RepoModel>.error('エラーが発生しました', StackTrace.fromString('疑似スタックトレース'));*/
      WidgetsFlutterBinding.ensureInitialized();
      const fakeData = MockData.jsonMock;
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
    });


    testWidgets('loadingのテスト', (WidgetTester tester) async {
      WidgetsFlutterBinding.ensureInitialized();
      AsyncValue<String> asyncValue = const AsyncValue.loading();

      const fakeData = MockData.jsonMock;
      await tester.pumpWidget(
        ProviderScope(
            overrides: [
              repositoryProvider.overrideWithValue(asyncValue),
            ],
            child: const MaterialApp(home: ListPage()),
          ),
      );
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
      );
      await tester.pump();
      expect(find.byKey(ListPage.noHitKey), findsOneWidget);
    });*/
  });
}

