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
import 'package:search_repo/domain/types/repo/repo_model.dart';
import 'package:search_repo/application/types/sort_enum.dart';
import 'package:tuple/tuple.dart';
import '../../http_mocks.dart';
import '../../mock_data.dart';

/// Usecaseのテスト
void main() {
  testWidgets('searchUsecaseのテスト', (WidgetTester tester) async {
    //clientが呼ばれた時、ステータスコード200,の偽データをセット
    final client = MockClient();
    const data = MockData.jsonMock;
    when(client.get(any)).thenAnswer((_) async => http.Response(data, 200));

    final RepoModel result = RepoModel.fromJson(json.decode(data));

    //プロバイダーをオーバーライド
    final container = ProviderContainer(
      overrides: [
        httpClientProvider.overrideWithValue(client),
      ],
    );

    //stateに仮の値を代入.(Stateに保存されていれば、ログに表示される。)
    final testUsecase = container.read(testProvider);
    testUsecase.test(result, 3, "Flutter", Sort.forks);

    //searchUseCaseを実行
    final searchUseCase =
        container.read(searchProvider((const Tuple2("Rails", null))));
    await searchUseCase.search();

    //Page番号が更新されてるかのテスト
    int page = container.read(pageNotifierProvider);
    await tester.pumpAndSettle();
    expect(page, 1);

    //Searchが更新されているかのチェック
    String search = container.read(searchNotifierProvider);
    await tester.pumpAndSettle();
    expect(search, "Rails");

    //Sort番号が維持されているかのチェック
    Sort sort = container.read(sortNotifierProvider);
    await tester.pumpAndSettle();
    expect(sort, Sort.forks);
  });
}
