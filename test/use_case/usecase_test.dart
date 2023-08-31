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
      //Mockを作成
      final client = MockClient();
      //faceJSONを設定
      const data = MockData.jsonMock;
      //clientにアクセスした際に、dataを返す
      when(client.get(any)).thenAnswer((_) async => http.Response(data, 200));
      //Providerを使用するためのコード
      final container = ProviderContainer();
      //faceDataを元に、リポジトリDIをセット
      final initialFetch = RepositoryImpl(apiDataSource: InitialFetch(client));
      //containerを使用してnotifierを取得
      final repoProviderNotifier = container.read(
          repoNotifierProvider.notifier);
      //initUsecaseを発動
      final init = InitAppUsecase(initialFetch: initialFetch,
          repoProviderNotifier: repoProviderNotifier);
      //値の取得〜stateに保存までが実行されることが期待される。
      await init.fetch();
      //更新されたStateを取得する
      final state = container.read(repoNotifierProvider);

      // 非同期データへのアクセス方法を修正
      final repoModel = state.when(
        data: (repoModel) => repoModel,
        loading: () => null,
        error: (_, __) => null,
      );
      //疑似データが取得できる
      expect(repoModel?.totalCount, 573491);
      expect(repoModel?.items[0].fullName, "flutter/flutter");
      expect(repoModel?.items[0].owner.avatarUrl,
          "https://avatars.githubusercontent.com/u/14101776?v=4");

      // テストランナーがまだ実行中の非同期処理を完了するようにする
      await tester.pumpAndSettle();
      await tester.runAsync(() async{});
    });
  });
}
