import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import '../../http_mocks.dart';
import '../../mock_data.dart';
/// Usecaseのテスト
void main() {
  testWidgets('addUsecaseのテスト', (WidgetTester tester) async {

    //clientが呼ばれた時、ステータスコード200,の偽データをセット
    final client = MockClient();
    const data = MockData.jsonMock;
    when(client.get(any)).thenAnswer((_) async => http.Response(data, 200));

    //プロバイダーをオーバーライド
    final container = ProviderContainer(
      overrides: [
        httpClientProvider.overrideWithValue(client),
      ],
    );

    //Repoの初期値がAsyncLoadingであるか確認。
    final repo = container.read(watchRepoProvider);
    await tester.pumpAndSettle();
    expect(repo, const AsyncLoading<Never>());

    //UseCaseを実行
    final addUseCase = container.read(refreshProvider);
    await addUseCase.refresh();

    //Page番号が更新されているかのチェック
    int page = container.read(pageNotifierProvider);
    await tester.pumpAndSettle();
    expect(page, 2);


    //RiverPodに保存できているかのチェック
    final updateRepo = container.read(watchRepoProvider);
    await tester.pumpAndSettle();
    expect(updateRepo, isA<AsyncValue<RepoModel>>());
  });
}
