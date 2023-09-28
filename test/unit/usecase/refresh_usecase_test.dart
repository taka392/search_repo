import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/di/usecases.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/application/types/sort_enum.dart';
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
    final Map<String, dynamic> map = json.decode(data) as Map<String, dynamic>;
    final RepoModel result = RepoModel.fromJson(map);

    //プロバイダーをオーバーライド
    final container = ProviderContainer(
      overrides: [
        httpClientProvider.overrideWithValue(client),
      ],
    );

    //stateに仮の値を代入
    final testUsecase = container.read(testProvider);
    testUsecase.test(result, 3, "Flutter", Sort.forks);

    //RefreshUseCaseを実行
    final addUseCase = container.read(refreshProvider);
    await addUseCase.refresh();

    //Page番号が更新されているかのチェック
    final int page = container.read(pageNotifierProvider);
    await tester.pumpAndSettle();
    expect(page, 1);

    //Searchが更新されているかのチェック
    final String search = container.read(searchNotifierProvider);
    await tester.pumpAndSettle();
    expect(search, "stars:>0");

    //Sort番号が更新されているかのチェック
    final Sort sort = container.read(sortNotifierProvider);
    await tester.pumpAndSettle();
    expect(sort, Sort.empty);
  });
}
