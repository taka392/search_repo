import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';

import 'package:search_repo/application/usecase/add_usecase.dart';
import 'package:search_repo/application/usecase/initial_usecase.dart';
import 'package:search_repo/application/usecase/search_usecase.dart';
import 'package:search_repo/infrastructure/repo/http_client.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';


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
final addAppProvider = Provider.family<AddUsecase, ScrollController>(
      (ref,controller) {
    final http = ref.watch(httpClientProvider);
    final page = ref.watch(pageNotifierProvider);
    final search = ref.watch(searchNotifierProvider);
    final sort = ref.watch(sortNotifierProvider);
    final repo = Repo(http,page,search,sort);
    final pageNotifier = ref.read(pageNotifierProvider.notifier);
    final repoNotifier = ref.read(repoNotifierProvider.notifier);
    return AddUsecase(
      pageNotifier: pageNotifier,
      repo: repo,
      repoNotifier: repoNotifier,
      controller: controller,
    );
  },
);

/// Search App
final searchProvider = Provider.family<SearchUsecase, String>(
      (ref,searchText) {
    final http = ref.watch(httpClientProvider);
    final page = ref.watch(pageNotifierProvider);
    final search = ref.watch(searchNotifierProvider);
    final sort = ref.watch(sortNotifierProvider);
    final repo = Repo(http,page,search,sort);
    final searchNotifier = ref.watch(searchNotifierProvider.notifier);
    final repoNotifier = ref.watch(repoNotifierProvider.notifier);
    return SearchUsecase(
        repo: repo,
        searchText: searchText,
        searchNotifier: searchNotifier,
        repoNotifier: repoNotifier,
    );
  },
);
