import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/post_repo_imt.dart';
import 'package:search_repo/application/state/repo.dart';
import 'package:search_repo/application/usecase/initial.dart';
import 'package:search_repo/infrastructure/repo/post_api.dart';

/// Init App
final initAppProvider = Provider<InitAppUsecase>(
      (ref) {
    final postRepositoryImpl = RepositoryImpl(initialFetch());
    final repoProviderNotifier = ref.read(repoNotifierProvider.notifier);
    return InitAppUsecase(
      postRepositoryImpl: postRepositoryImpl,
      repoProviderNotifier: repoProviderNotifier,
    );
  },
);