import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/state/page/page_provider.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/application/state/search/search_provider.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/application/usecase/add_usecase.dart';
import 'package:search_repo/application/usecase/initial_usecase.dart';
import 'package:search_repo/infrastructure/repo/http_client.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';


/// Init App
final initAppProvider = Provider<InitUsecase>(
      (ref) {
    final http = ref.watch(httpClientProvider);
    final int page = ref.read(pageProvider);
    final search = ref.read(searchProvider);
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
final addAppProvider = Provider<AddUsecase>(
      (ref) {
    final http = ref.watch(httpClientProvider);
    final page = ref.read(pageProvider);
    final search = ref.read(searchProvider);
    final sort = ref.watch(sortNotifierProvider);
    final repo = Repo(http,page,search,sort);
    final pageNotifier = ref.read(pageProvider.notifier);
    final repoNotifier = ref.read(repoNotifierProvider.notifier);
    return AddUsecase(
      pageNotifier: pageNotifier,
      repo: repo,
      repoNotifier: repoNotifier,
    );
  },
);
