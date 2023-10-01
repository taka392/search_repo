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
import 'package:tuple/tuple.dart';

import '../../fake/http_mocks.dart';
import '../../fake/interfaces/internet.dart';
import '../../fake/mock_data.dart';

/// Usecaseのテスト
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('addUsecaseのテスト', () async {
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
        internetProvider.overrideWithValue(FakeInternetImpl()),
      ],
    );

    //stateに仮の値を代入.(Stateに保存されていれば、ログに表示される。)
    final testUsecase = container.read(testProvider);
    testUsecase.test(result, 3, "Flutter", Sort.forks);

    //sortUseCaseを実行
    final searchUseCase =
        container.read(sortProvider(const Tuple2(Sort.stars, null)));
    await searchUseCase.sort();

    //Page番号が維持されてるかのテスト
    final int page = container.read(pageNotifierProvider);
    expect(page, 3);

    //Searchが維持されているかのテスト
    final String search = container.read(searchNotifierProvider);
    expect(search, "Flutter");

    //Sort番号が更新されているかのテスト
    final Sort sort = container.read(sortNotifierProvider);
    expect(sort, Sort.stars);
  });
}
