import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/domain/types/repo_model.dart';


final watchRepoProvider = Provider<AsyncValue<RepoModel>>((ref) {
  return ref.watch(repoProvider);
});


final repoProvider = StateNotifierProvider<RepoNotifier<RepoModel>, AsyncValue<RepoModel>>(
      (ref) => RepoNotifier<RepoModel>(),
);




