import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/application/usecase/add_usecase.dart';
import 'package:search_repo/application/usecase/initial_usecase.dart';
import 'package:search_repo/application/usecase/refresh_usecase.dart';
import 'package:search_repo/application/usecase/search_usecase.dart';
import 'package:search_repo/application/usecase/sort_usecase.dart';
import 'package:search_repo/domain/types/sort_enum.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';
import 'package:tuple/tuple.dart';


/// Init App
final initAppProvider = Provider<InitUsecase>(
      (ref) {
    final http = ref.watch(httpClientProvider);
    final page = ref.watch(pageNotifierProvider);
    final search = ref.watch(searchNotifierProvider);
    final sort = ref.watch(sortNotifierProvider);
    final repo = Repo(http,page,search,sort);
    final repoNotifier = ref.read(repoNotifierProvider.notifier);
    return InitUsecase(
      repo: repo,
      repoNotifier: repoNotifier,
    );
  },
);

/// Add App
final addAppProvider = Provider.family<AddUsecase,ScrollController>(
      (ref,scrollController) {
    final http = ref.watch(httpClientProvider);
    final page = ref.watch(pageNotifierProvider);
    final search = ref.watch(searchNotifierProvider);
    final sort = ref.watch(sortNotifierProvider);
    final repo = Repo(http,page+1,search,sort);
    final pageNotifier = ref.read(pageNotifierProvider.notifier);
    final repoNotifier = ref.read(repoNotifierProvider.notifier);
    return AddUsecase(
      pageNotifier: pageNotifier,
      repo: repo,
      repoNotifier: repoNotifier,
      scrollController: scrollController,
    );
  },
);

/// Search App
final searchProvider = Provider.family<SearchUsecase, Tuple2<String, ScrollController>>(
      (ref, data) {
    final searchText = data.item1;
    final scrollController = data.item2;
    final http = ref.watch(httpClientProvider);
    final page = ref.watch(pageNotifierProvider);
    final sort = ref.watch(sortNotifierProvider);
    final repo = Repo(http, page, searchText, sort);
    final searchNotifier = ref.watch(searchNotifierProvider.notifier);
    final repoNotifier = ref.watch(repoNotifierProvider.notifier);
    final pageNotifier = ref.watch(pageNotifierProvider.notifier);

    return SearchUsecase(
      repo: repo,
      searchText: searchText,
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
    final repoNotifier = ref.read(repoNotifierProvider.notifier);
    final sortNotifier = ref.read(sortNotifierProvider.notifier);
    final pageNotifier = ref.read(pageNotifierProvider.notifier);
    final http = ref.watch(httpClientProvider);
    final repo = Repo(http,1,'stars:>0',Sort.stars);
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
);
