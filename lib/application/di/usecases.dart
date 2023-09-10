import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/repository.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/application/usecase/add_usecase.dart';
import 'package:search_repo/application/usecase/detail_usecase.dart';
import 'package:search_repo/application/usecase/refresh_usecase.dart';
import 'package:search_repo/application/usecase/search_usecase.dart';
import 'package:search_repo/application/usecase/sort_usecase.dart';
import 'package:search_repo/application/usecase/test_usecase.dart';
import 'package:search_repo/domain/types/item/item_model.dart';
import 'package:search_repo/application/types/sort_enum.dart';
import 'package:tuple/tuple.dart';

/// Add App
//画面一番下までスクロールした際に発火するリポジトリ追加取得用のUsecaseです。
final addProvider =
    Provider.family<AddUsecase, ScrollController?>((ref, scrollController) {
  final pageNotifier = ref.read(pageNotifierProvider.notifier);
  final repo = ref.read(repositoryProvider);
  final repoNotifier = ref.read(repoProvider.notifier);
  return AddUsecase(
    repo: repo,
    repoNotifier: repoNotifier,
    scrollController: scrollController,
    pageNotifier: pageNotifier,
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
//リフレッシュ処理用のUsecaseです。
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
//絞り込み用のUsecaseです。主にドロップダウンで使用します。
final sortProvider =
    Provider.family<SortUsecase, Tuple2<Sort, ScrollController?>>(
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

/// Test APP
// テスト用に初期値を変更するUsecaseです。
final testProvider = Provider<TestUsecase>(
  (ref) {
    final searchNotifier = ref.read(searchNotifierProvider.notifier);
    final repoNotifier = ref.read(repoProvider.notifier);
    final sortNotifier = ref.read(sortNotifierProvider.notifier);
    final pageNotifier = ref.read(pageNotifierProvider.notifier);
    final repo = ref.watch(repositoryProvider);
    return TestUsecase(
      pageNotifier: pageNotifier,
      repoNotifier: repoNotifier,
      searchNotifier: searchNotifier,
      sortNotifier: sortNotifier,
      repo: repo,
    );
  },
);
