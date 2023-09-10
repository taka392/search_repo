import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/domain/types/repo/repo_model.dart';

//repoProviderをWatchする。
final watchRepoProvider = Provider<AsyncValue<RepoModel>>((ref) {
  return ref.watch(repoProvider);
});


final repoProvider = StateNotifierProvider<RepoNotifier<RepoModel>, AsyncValue<RepoModel>>(
      (ref) => RepoNotifier<RepoModel>(),
);




