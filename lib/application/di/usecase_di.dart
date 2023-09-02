import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/repo_di.dart';
import 'package:search_repo/application/state/repo.dart';
import 'package:search_repo/application/usecase/initial_usecase.dart';

import 'package:search_repo/infrastructure/repo/http_client.dart';
import 'package:search_repo/infrastructure/repo/init_repo.dart';


/// Init App
final initAppProvider = Provider<InitUsecase>(
      (ref) {
    final http = ref.watch(httpClientProvider);
    final initRepo = RepositoryImpl(repository: InitRepo(http));
    final repoProviderNotifier = ref.read(repoNotifierProvider.notifier);
    return InitUsecase(
      initRepo: initRepo,
      repoProviderNotifier: repoProviderNotifier,
    );
  },
);
