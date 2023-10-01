import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/application/di/internet.dart';
import 'package:search_repo/application/di/repository.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/application/types/sort_enum.dart';
import 'package:search_repo/application/usecase/load_more_usecase.dart';
import 'package:search_repo/application/usecase/refresh_usecase.dart';
import 'package:search_repo/application/usecase/search_usecase.dart';
import 'package:search_repo/application/usecase/sort_usecase.dart';
import 'package:search_repo/application/usecase/test_usecase.dart';
import 'package:tuple/tuple.dart';

/// loadMore App
//画面一番下までスクロールした際に発火するリポジトリ追加取得用のUsecaseです。
final loadMoreProvider = Provider.family<LoadMoreUsecase, ScrollController?>(
    (ref, scrollController) {
  final pageNotifier = ref.watch(pageNotifierProvider.notifier);
  final repo = ref.watch(repositoryProvider);
  final repoNotifier = ref.watch(repoProvider.notifier);
  final connectivity = ref.watch(internetProvider);
  return LoadMoreUsecase(
    repo: repo,
    repoNotifier: repoNotifier,
    scrollController: scrollController,
    pageNotifier: pageNotifier,
    connectivity: connectivity,
  );
});

/// Search App
//検索用のUsecaseです。
final searchProvider =
    Provider.family<SearchUsecase, Tuple2<String, ScrollController?>>(
  (ref, data) {
    final text = data.item1;
    final scrollController = data.item2;
    final searchNotifier = ref.watch(searchNotifierProvider.notifier);
    final repo = ref.watch(repositoryProvider);
    final repoNotifier = ref.watch(repoProvider.notifier);
    final pageNotifier = ref.watch(pageNotifierProvider.notifier);
    final connectivity = ref.watch(internetProvider);
    return SearchUsecase(
      repo: repo,
      text: text,
      searchNotifier: searchNotifier,
      repoNotifier: repoNotifier,
      pageNotifier: pageNotifier,
      scrollController: scrollController,
      connectivity: connectivity,
    );
  },
);

/// Refresh App
//リフレッシュ処理用のUsecaseです。
final refreshProvider = Provider<RefreshUsecase>(
  (ref) {
    final searchNotifier = ref.watch(searchNotifierProvider.notifier);
    final repoNotifier = ref.watch(repoProvider.notifier);
    final sortNotifier = ref.watch(sortNotifierProvider.notifier);
    final pageNotifier = ref.watch(pageNotifierProvider.notifier);
    final repo = ref.watch(repositoryProvider);
    final connectivity = ref.watch(internetProvider);
    return RefreshUsecase(
      pageNotifier: pageNotifier,
      repoNotifier: repoNotifier,
      searchNotifier: searchNotifier,
      sortNotifier: sortNotifier,
      repo: repo,
      connectivity: connectivity,
    );
  },
);

/// Sort App
//絞り込み用のUsecaseです。主にドロップダウンで使用します。
final sortProvider =
    Provider.family<SortUsecase, Tuple2<Sort, ScrollController?>>(
  (ref, data) {
    final value = data.item1;
    final scrollController = data.item2;
    final repoNotifier = ref.watch(repoProvider.notifier);
    final sortNotifier = ref.watch(sortNotifierProvider.notifier);
    final repo = ref.watch(repositoryProvider);
    final connectivity = ref.watch(internetProvider);
    return SortUsecase(
      repoNotifier: repoNotifier,
      sortNotifier: sortNotifier,
      repo: repo,
      data: value,
      scrollController: scrollController,
      connectivity: connectivity,
    );
  },
);

/// Test APP
// テスト用に初期値を変更するUsecaseです。
final testProvider = Provider<TestUsecase>(
  (ref) {
    final searchNotifier = ref.watch(searchNotifierProvider.notifier);
    final repoNotifier = ref.watch(repoProvider.notifier);
    final sortNotifier = ref.watch(sortNotifierProvider.notifier);
    final pageNotifier = ref.watch(pageNotifierProvider.notifier);
    final repo = ref.watch(repositoryProvider);
    final connectivity = ref.watch(internetProvider);
    return TestUsecase(
      pageNotifier: pageNotifier,
      repoNotifier: repoNotifier,
      searchNotifier: searchNotifier,
      sortNotifier: sortNotifier,
      repo: repo,
      connectivity: connectivity,
    );
  },
);
