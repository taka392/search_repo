import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/post_api.dart';

import 'http_server_test.mocks.dart';
import '../domain/mock_data.dart';

@GenerateMocks([http.Client])
void main() {
  group('リポジトリテスト', () {
    test('成功時RepoModelが取得できるかのテスト', () async {
      final client = MockClient();
      const data = MockData.jsonMock;
      when(client.get(any)).thenAnswer((_) async => http.Response(data, 200));
      final initClass = InitialFetch(client);
      final repo = await initClass.initRepo();
      expect(repo, isA<RepoModel>());
    });
    test('失敗時throwsExceptionが実行されるかのテスト', () async {
      final client = MockClient();
      when(client.get(any)).thenAnswer((_) async => http.Response('Not Found', 404));
      final initClass = InitialFetch(client);
      expect(() async => await initClass.initRepo(), throwsException);
    });
  });
}