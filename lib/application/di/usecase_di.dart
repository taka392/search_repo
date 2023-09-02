import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/repo_di.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/usecase/add_usecase.dart';
import 'package:search_repo/application/usecase/initial_usecase.dart';
import 'package:search_repo/infrastructure/repo/add_repo.dart';

import 'package:search_repo/infrastructure/repo/http_client.dart';
import 'package:search_repo/infrastructure/repo/init_repo.dart';


/// Init App
final initAppProvider = Provider<InitUsecase>(
      (ref) {
    final http = ref.watch(httpClientProvider);
    final page = ref.watch(pageNotifierProvider);
    final search = ref.watch(searchNotifierProvider);
    final sort = ref.watch(searchNotifierProvider);
    final initRepo = RepositoryImpl(repository: InitRepo(http,page,search,sort));
    final repoProviderNotifier = ref.read(repoNotifierProvider.notifier);
    return InitUsecase(
      initRepo: initRepo,
      repoProviderNotifier: repoProviderNotifier,
    );
  },
);
final addAppProvider = Provider<AddUsecase>(
      (ref) {
    final http = ref.watch(httpClientProvider);
    final page = ref.watch(pageNotifierProvider);
    final search = ref.watch(searchNotifierProvider);
    final sort = ref.watch(searchNotifierProvider);
    final repository = AddRepo(http,page,search,sort);
    final addRepo = RepositoryImpl(repository: repository);
    final repoProviderNotifier = ref.read(repoNotifierProvider.notifier);
    final repo = ref.read(repoNotifierProvider);
    final pageNotifier = ref.watch(pageNotifierProvider);
    return AddUsecase(
      repoProviderNotifier: repoProviderNotifier,
      newRepo: newRepo,
      oldRepo: oldRepo,
      pageNotifier: pageNotifier,
    );
  },
);
