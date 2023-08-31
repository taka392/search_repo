import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/di/repo_di.dart';
import 'package:search_repo/application/state/repo.dart';
import 'package:search_repo/application/usecase/initial.dart';
import 'package:search_repo/infrastructure/repo/post_api.dart';
import '../infrastructure/http_server_test.mocks.dart';
import '../domain/mock_data.dart';
import 'package:http/http.dart' as http;
void main() {
  group('usecaseテスト', () {
    testWidgets('initUsecaseのテスト', (WidgetTester tester) async {
      final client = MockClient();
      const data = MockData.jsonMock;
      when(client.get(any)).thenAnswer((_) async => http.Response(data, 200));
      final container = ProviderContainer();

      final initialFetch = RepositoryImpl(apiDataSource: InitialFetch(client));
      final repoProviderNotifier = container.read(repoNotifierProvider.notifier);
      final init = InitAppUsecase(initialFetch: initialFetch, repoProviderNotifier: repoProviderNotifier);
      await init.fetch();

      final state = container.read(repoNotifierProvider);

      // 非同期データへのアクセス方法を修正
      final repoModel = state.when(
        data: (repoModel) => repoModel,
        loading: () => null,
        error: (_, __) => null,
      );
      expect(repoModel?.totalCount, 573491);
      expect(repoModel?.items[0].fullName, "flutter/flutter");
      expect(repoModel?.items[0].owner.avatarUrl, "https://avatars.githubusercontent.com/u/14101776?v=4");
    });
  });
}

