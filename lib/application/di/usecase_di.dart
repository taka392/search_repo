import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/repo_di.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/usecase/add_usecase.dart';
import 'package:search_repo/application/usecase/initial_usecase.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/http_client.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';


/// Init App
final initAppProvider = Provider<InitUsecase>(
      (ref) {
    final http = ref.watch(httpClientProvider);
    final page = ref.watch(pageNotifierProvider);
    final search = ref.watch(searchNotifierProvider);
    final sort = ref.watch(searchNotifierProvider);
    final repo = RepositoryImpl(repository: Repo(http,page,search,sort));
    final repoProviderNotifier = ref.read(repoNotifierProvider.notifier);
    return InitUsecase(
      repo: repo,
      repoProviderNotifier: repoProviderNotifier,
    );
  },
);
final addAppProvider = Provider.family<AddUsecase,RepoModel>(
      (ref,oldRepo) {
    final http = ref.watch(httpClientProvider);
    final page = ref.watch(pageNotifierProvider);
    final search = ref.watch(searchNotifierProvider);
    final sort = ref.watch(searchNotifierProvider);
    final repository = Repo(http,page,search,sort);
    final repo = RepositoryImpl(repository: repository);
    final repoNotifier = ref.read(repoNotifierProvider.notifier);
    final pageNotifier = ref.read(pageNotifierProvider.notifier);
    return AddUsecase(
      oldRepo: oldRepo,
      pageNotifier: pageNotifier,
      repo: repo,
      repoNotifier: repoNotifier,
    );
  },
);
