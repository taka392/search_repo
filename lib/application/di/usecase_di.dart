import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/application/usecase/add_usecase.dart';
import 'package:search_repo/application/usecase/detail_usecase.dart';
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
/// この処理はRefreshのみでいいので、後に修正する。

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

/// Search App
final searchProvider =
    Provider.family<SearchUsecase, Tuple2<String, ScrollController>>(
  (ref, data) {
    final text = data.item1;
    final scrollController = data.item2;
    final searchNotifier = ref.watch(searchNotifierProvider.notifier);
    final repo = ref.watch(repositoryProvider);
    final repoNotifier = ref.watch(repoProvider.notifier);
    final pageNotifier = ref.watch(pageNotifierProvider.notifier);
    return SearchUsecase(
      repo: repo,
      text: text,
      searchNotifier: searchNotifier,
      repoNotifier: repoNotifier,
      pageNotifier: pageNotifier,
      scrollController: scrollController,
    );
  },
);

/// Refresh App
final refreshProvider = Provider<RefreshUsecase>(
  (ref) {
    final searchNotifier = ref.read(searchNotifierProvider.notifier);
    final repoNotifier = ref.read(repoProvider.notifier);
    final sortNotifier = ref.read(sortNotifierProvider.notifier);
    final pageNotifier = ref.read(pageNotifierProvider.notifier);
    final repo = ref.watch(repositoryProvider);
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
    final repoNotifier = ref.read(repoProvider.notifier);
    final sortNotifier = ref.read(sortNotifierProvider.notifier);
    final repo = ref.watch(repositoryProvider);
    return SortUsecase(
      repoNotifier: repoNotifier,
      sortNotifier: sortNotifier,
      repo: repo,
      data: value,
      scrollController: scrollController,
    );
  },
);
/// Detail App
//画面をタップしたら、詳細画面を表示させるUsecaseです。
final detailProvider = Provider.family<DetailUsecase, ItemModel>(
      (ref, data) {
    return DetailUsecase(
      url: data.owner.htmlUrl,
    );
  },
);
