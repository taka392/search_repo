import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/src/framework.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/application/usecase/add_usecase.dart';
import 'package:search_repo/application/usecase/detail_usecase.dart';
import 'package:search_repo/application/usecase/initial_usecase.dart';
import 'package:search_repo/application/usecase/refresh_usecase.dart';
import 'package:search_repo/application/usecase/search_usecase.dart';
import 'package:search_repo/application/usecase/sort_usecase.dart';
import 'package:search_repo/domain/types/item_model.dart';
import 'package:search_repo/domain/types/sort_enum.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';
import 'package:tuple/tuple.dart';


///リポジトリインスタンスを取得する。
final repositoryProvider = Provider<Repo>((ref) {
  final httpClient = ref.watch(httpClientProvider);
  final page = ref.watch(pageNotifierProvider);
  final search = ref.watch(searchNotifierProvider);
  final sort = ref.watch(sortNotifierProvider);
  return RepoImpl(httpClient: httpClient, page: page, search: search, sort: sort);
});


/// Init App
final initAppProvider = Provider<InitUsecase>(
  (ref) {
    final repo = ref.watch(repositoryProvider);
    final repoNotifier = ref.watch(repoProvider.notifier);
    return InitUsecase(
      repo: repo,
      repoNotifier: repoNotifier,
    );
  },
);

/// Add App
final addAppProvider = Provider.family<AddUsecase, ScrollController>(
  (ref, scrollController) {
    final pageNotifier = ref.read(pageNotifierProvider.notifier);
    final repo = ref.read(repositoryProvider);
    final repoNotifier = ref.read(repoProvider.notifier);
    return AddUsecase(
      repo: repo,
      repoNotifier: repoNotifier,
      scrollController: scrollController,
      pageNotifier: pageNotifier,
    );
  }
);

/*/// Search App
final searchProvider =
    Provider.family<SearchUsecase, Tuple2<String, ScrollController>>(
  (ref, data) {
    final search = data.item1;
    final scrollController = data.item2;
    final searchNotifier = ref.watch(searchNotifierProvider.notifier);
    searchNotifier.update(search);
    final repo = ref.watch(repositoryProvider);
    final repoNotifier = ref.watch(repoProvider.notifier);
    final pageNotifier = ref.watch(pageNotifierProvider.notifier);
    return SearchUsecase(
      repo: repo,
      searchText: search,
      searchNotifier: searchNotifier,
      repoNotifier: repoNotifier,
      pageNotifier: pageNotifier,
      scrollController: scrollController,
    );
  },
);*/

/*/// Refresh App
final refreshProvider = Provider<RefreshUsecase>(
  (ref) {
    final searchNotifier = ref.read(searchNotifierProvider.notifier);
    final repoNotifier = ref.read(repoNotifierProvider.notifier);
    final sortNotifier = ref.read(sortNotifierProvider.notifier);
    final pageNotifier = ref.read(pageNotifierProvider.notifier);
    final http = ref.watch(httpClientProvider);
    final repo = Repo(http, 1, 'stars:>0', Sort.stars);
    return RefreshUsecase(
      pageNotifier: pageNotifier,
      repoNotifier: repoNotifier,
      searchNotifier: searchNotifier,
      sortNotifier: sortNotifier,
      repo: repo,
    );
  },
);

/// Sort App
final sortProvider =
    Provider.family<SortUsecase, Tuple2<Sort, ScrollController>>(
  (ref, data) {
    final value = data.item1;
    final scrollController = data.item2;
    final repoNotifier = ref.read(repoNotifierProvider.notifier);
    final sortNotifier = ref.read(sortNotifierProvider.notifier);
    final http = ref.watch(httpClientProvider);
    final page = ref.watch(pageNotifierProvider);
    final search = ref.watch(searchNotifierProvider);
    final repo = Repo(http, page, search, value);
    return SortUsecase(
      repoNotifier: repoNotifier,
      sortNotifier: sortNotifier,
      repo: repo,
      value: value,
      scrollController: scrollController,
    );
  },
);*/
/// Detail App
//画面をタップしたら、詳細画面を表示させるUsecaseです。
final detailProvider = Provider.family<DetailUsecase, ItemModel>(
      (ref, data) {
    return DetailUsecase(
      url: data.owner.htmlUrl,
    );
  },
);
