import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/repo_di.dart';
import 'package:search_repo/application/state/repo.dart';
import 'package:search_repo/application/usecase/initial.dart';
import 'package:search_repo/infrastructure/repo/http_client.dart';
import 'package:search_repo/infrastructure/repo/post_api.dart';

/// Init App
final initAppProvider = Provider<InitAppUsecase>(
      (ref) {
    final http = ref.watch(httpClientProvider);
    final repoDi = RepositoryImpl(apiDataSource: InitialFetch(http));
    final repoProviderNotifier = ref.read(repoNotifierProvider.notifier);
    return InitAppUsecase(
      initialFetch: repoDi,
      repoProviderNotifier: repoProviderNotifier,
    );
  },
);