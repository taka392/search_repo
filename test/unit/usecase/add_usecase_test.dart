import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/src/framework.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';
import '../../fake_repo.dart';
import '../../http_mocks.dart';
import '../../mock_data.dart';
/// Usecaseのテスト
void main() {


    test('addUsecaseのテスト', () async {

      //偽のリポジトリデータの作成
      final jsonDecode = json.decode(MockData.jsonMock);
      final RepoModel result = RepoModel.fromJson(jsonDecode);
      AsyncValue<RepoModel> fakeState = AsyncData(result);


      //clientが呼ばれた時、ステータスコード200,の偽データをセット
      final client = MockClient();
      const data = MockData.jsonMock;
      when(client.get(any)).thenAnswer((_) async => http.Response(data, 200));


      //プロバイダーをオーバーライド
      final container = ProviderContainer(
        overrides: [
          httpClientProvider.overrideWithValue(client),
          watchRepoProvider.overrideWithValue(fakeState),
        ],
      );

      final addUseCase = container.read(addAppProvider());
      addUseCase.refresh();

      final page = container.read(pageNotifierProvider);

      expect(page, 4);
    });
    test('失敗時throwsExceptionが実行されるかのテスト', () async {
      final client = MockClient();
      when(client.get(any)).thenAnswer((_) async => http.Response('Not Found', 404));
      final container = ProviderContainer(
        overrides: [httpClientProvider.overrideWithValue(client)],
      );
      final repo = container.read(repositoryProvider);
      // 以下の部分を修正して、エラー時に throwsException をキャッチするようにします
      expect(() async => await repo.getRepo(), throwsException);
    });
}
