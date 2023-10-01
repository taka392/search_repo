import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/di/internet.dart';
import 'package:search_repo/application/di/usecases.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/application/types/sort_enum.dart';
import 'package:search_repo/domain/types/repo_model.dart';

import '../../component/http_mocks.dart';
import '../../component/interfaces/internet.dart';
import '../../component/mock_data.dart';

/// LeadMoreUsecaseのテスト
void main() {
  testWidgets('LeadMoreUsecaseのテスト', (WidgetTester tester) async {
    //clientが呼ばれた時、ステータスコード200,の偽データをセット
    final client = MockClient();
    const data = MockData.jsonMock;
    when(client.get(any)).thenAnswer((_) async => http.Response(data, 200));

    //偽の値をStateに保存。
    final Map<String, dynamic> map = json.decode(data) as Map<String, dynamic>;
    final RepoModel result = RepoModel.fromJson(map);

    final container = ProviderContainer(
      overrides: [
        httpClientProvider.overrideWithValue(client),
        internetProvider.overrideWithValue(FakeInternetImpl()),
      ],
    );

    //stateに仮の値を代入.
    final testUsecase = container.read(testProvider);
    testUsecase.test(result, 3, "Flutter", Sort.forks);

    //loadMoreCaseを実行
    final addUseCase = container.read(loadMoreProvider(null));
    await addUseCase.add();
    //Page番号が更新されているかのチェック
    final int page = container.read(pageNotifierProvider);
    await tester.pumpAndSettle();
    expect(page, 4);

    //Searchが維持されてるかのチェック
    final String search = container.read(searchNotifierProvider);
    await tester.pumpAndSettle();
    expect(search, "Flutter");

    //Sort番号が維持されてるかのチェック
    final Sort sort = container.read(sortNotifierProvider);
    await tester.pumpAndSettle();
    expect(sort, Sort.forks);
  });
}
