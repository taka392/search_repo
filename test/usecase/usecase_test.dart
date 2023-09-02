import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/application/usecase/initial_usecase.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';
import 'package:http/http.dart' as http;
import '../domain/mock_data.dart';
import '../infrastructure/http_server_test.mocks.dart';

void main() {
  group('テスト', () {
    test('aaのテスト', () async {
      final client = MockClient();
      const data = MockData.jsonMock;
      when(client.get(any)).thenAnswer((_) async => http.Response(data, 200));
      final container = ProviderContainer();
      final page = container.read(pageNotifierProvider);
      final search = container.read(searchNotifierProvider);
      final sort = container.read(sortNotifierProvider);
      final repo = Repo(client,page,search,sort);
      RepoModel repoModel = await repo.getRepo();
      expect(repoModel, isA<RepoModel>());
      //containerを使用してnotifierを取得
      final repoNotifier = container.read(repoNotifierProvider.notifier);
      //initUsecaseを発動
      debugPrint(repoNotifier.toString());
      final usecase = InitUsecase(
        repo: repo,
        repoNotifier: repoNotifier,
      );
      //値の取得〜stateに保存までが実行されることが期待される。
      await usecase.init();
      //更新されたStateを取得する
      final state = container.read(repoNotifierProvider);

      // 非同期データへのアクセス方法を修正
      final result = state.when(
        data: (repoModel) => repoModel,
        loading: () => null,
        error: (_, __) => null,
      );
      //疑似データが取得できる
      expect(result, isA<RepoModel>());
      // テストランナーがまだ実行中の非同期処理を完了するようにする
    });
  });
}
