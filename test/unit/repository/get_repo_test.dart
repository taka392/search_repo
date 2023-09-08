import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import '../../http_mocks.dart';
import '../../mock_data.dart';



/// リポジトリ取得関数のテスト
@GenerateMocks([http.Client])
void main() {
  group('getRepo関数のテスト', () {
    test('成功時のテスト', () async {
      final client = MockClient();
      const data = MockData.jsonMock;
      when(client.get(any)).thenAnswer((_) async => http.Response(data, 200));
      final container = ProviderContainer(
        overrides: [httpClientProvider.overrideWithValue(client)],
      );
      final repo = container.read(repositoryProvider);
      RepoModel repoModel = await repo.getRepo();
      expect(repoModel, isA<RepoModel>());

    });
    test('失敗時のテスト', () async {
      final client = MockClient();
      when(client.get(any)).thenAnswer((_) async => http.Response('Not Found', 404));
      final container = ProviderContainer(
        overrides: [httpClientProvider.overrideWithValue(client)],
      );
      final repo = container.read(repositoryProvider);
      // 以下の部分を修正して、エラー時に throwsException をキャッチするようにします
      expect(() async => await repo.getRepo(), throwsException);
    });

  });
}