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
  test('aaのテスト', () async {
    // ProviderContainerを作成し、Providerを初期化
    final container = ProviderContainer();
    final repoNotifier = await container.read(repoNotifierProvider.notifier).build(); // 初期化を待つ
    debugPrint(repoNotifier.toString());

    const data = MockData.jsonMock;

    // 他のセットアップ作業
    final client = MockClient();
    when(client.get(any)).thenAnswer((_) async => http.Response(data, 200));
    debugPrint("dd");

    final page = container.read(pageNotifierProvider);
    final search = container.read(searchNotifierProvider);
    final sort = container.read(sortNotifierProvider);
    final repo = Repo(client, page, search, sort);

    // InitUsecaseのための準備
    final usecase = InitUsecase(
      repo: repo,
      repoNotifier: repoNotifier,
    );

    // InitUsecaseを実行し、結果を検証
    await usecase.init();
    final state = container.read(repoNotifierProvider);

    final result = state.when(
      data: (repoModel) => repoModel,
      loading: () => null,
      error: (_, __) => null,
    );

    // 疑似データが取得できることを確認
    expect(result, isA<RepoModel>());
  });
}
