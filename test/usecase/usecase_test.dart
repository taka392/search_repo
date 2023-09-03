import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/application/usecase/add_usecase.dart';
import 'package:search_repo/application/usecase/initial_usecase.dart';
import 'package:search_repo/application/usecase/refresh_usecase.dart';
import 'package:search_repo/application/usecase/search_usecase.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';
import 'package:http/http.dart' as http;

import '../domain/mock_data.dart';
import '../infrastructure/http_server_test.mocks.dart';
void main() {
  group('UseCaseのテスト', () {
  test('InitialUseCaseのテスト', () async {
    // ProviderContainerを作成し、Providerを初期化
    WidgetsFlutterBinding.ensureInitialized();
    final container = ProviderContainer();
    final repoNotifier = container.read(repoNotifierProvider.notifier);
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
    expect(result, isA<RepoModel>());
  });
  test('AddUseCaseのテスト', () async {
    // ProviderContainerを作成し、Providerを初期化
    WidgetsFlutterBinding.ensureInitialized();
    final container = ProviderContainer();

    final client = MockClient();
    const data = MockData.jsonMock;
    when(client.get(any)).thenAnswer((_) async => http.Response(data, 200));


    final page = container.read(pageNotifierProvider);
    final search = container.read(searchNotifierProvider);
    final sort = container.read(sortNotifierProvider);
    final repo = Repo(client, page, search, sort);

    final pageNotifier = container.read(pageNotifierProvider.notifier);
    final repoNotifier = container.read(repoNotifierProvider.notifier);


    final usecase = AddUsecase(
      pageNotifier: pageNotifier,
      repo: repo,
      repoNotifier: repoNotifier,
      controller: null,
    );

    await usecase.add();
    final pageNumber = container.read(pageNotifierProvider);
    final result = container.read(repoNotifierProvider);
    expect(pageNumber, 2);
    expect(result.value!.items.length, 40);
  });

  test('SearchUseCaseのテスト', () async {
    // ProviderContainerを作成し、Providerを初期化
    WidgetsFlutterBinding.ensureInitialized();
    final container = ProviderContainer();

    final client = MockClient();
    const data = MockData.jsonMock;
    when(client.get(any)).thenAnswer((_) async => http.Response(data, 200));


    final page = container.read(pageNotifierProvider);
    final search = container.read(searchNotifierProvider);
    final sort = container.read(sortNotifierProvider);
    final repo = Repo(client, page, search, sort);
    final searchNotifier = container.read(searchNotifierProvider.notifier);
    final repoNotifier = container.read(repoNotifierProvider.notifier);


    final usecase = SearchUsecase(
      repo: repo,
      searchText: "Flutter",
      searchNotifier: searchNotifier,
      repoNotifier: repoNotifier,
    );
    await usecase.search();
    final state = container.read(repoNotifierProvider);

    final result = state.when(
    data: (repoModel) => repoModel,
    loading: () => null,
    error: (_, __) => null,
    );

    const flutterText = 'Flutter'; // テストしたいテキスト
    final containsFlutter = result?.items.any((item) =>
    item.name.toLowerCase().contains(flutterText.toLowerCase())
    );
    expect(containsFlutter, isTrue);
  });
  test('RefreshUseCaseのテスト', () async {
    // ProviderContainerを作成し、Providerを初期化
    WidgetsFlutterBinding.ensureInitialized();
    final container = ProviderContainer();

    final client = MockClient();
    const data = MockData.jsonMock;
    when(client.get(any)).thenAnswer((_) async => http.Response(data, 200));


    final page = container.read(pageNotifierProvider);
    final search = container.read(searchNotifierProvider);
    final sort = container.read(sortNotifierProvider);
    RepoModel oldRepo = Repo(client, 4, "Rails", sort) as RepoModel;
    final repoNotifier = container.read(repoNotifierProvider.notifier);
    repoNotifier.save(oldRepo);


    final usecase = RefreshUsecase(
      pageNotifier: pageNotifier,
      repoNotifier: repoNotifier,
      searchNotifier: searchNotifier,
      sortNotifier: sortNotifier,
      repo: repo,
    );
    await usecase.search();
    final state = container.read(repoNotifierProvider);

    final result = state.when(
      data: (repoModel) => repoModel,
      loading: () => null,
      error: (_, __) => null,
    );

    const flutterText = 'Flutter'; // テストしたいテキスト
    final containsFlutter = result?.items.any((item) =>
        item.name.toLowerCase().contains(flutterText.toLowerCase())
    );
    expect(containsFlutter, isTrue);
  });

  });
}
