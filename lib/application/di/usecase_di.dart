import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/repo_di.dart';
import 'package:search_repo/application/state/repo.dart';
import 'package:search_repo/application/usecase/initial_usecase.dart';

import 'package:search_repo/infrastructure/repo/http_client.dart';
import 'package:search_repo/infrastructure/repo/post_api.dart';

/// Init App
final initAppProvider = Provider<InitUsecase>(
      (ref) {
    final http = ref.watch(httpClientProvider);
    final initialFetch = RepositoryImpl(repository: InitialFetch(http));
    final repoProviderNotifier = ref.read(repoNotifierProvider.notifier);
    return InitUsecase(
      initialFetch: initialFetch,
      repoProviderNotifier: repoProviderNotifier,
    );
  },
);