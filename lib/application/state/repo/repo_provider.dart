import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/domain/types/repo_model.dart';

//非同期→同期に変更
final repoStateProvider = Provider((ref) {
  final asyncData = ref.watch(asyncValueProvider);
  // 非同期データを同期的なStateに変換
  if (asyncData is AsyncData<RepoModel>) {
    return asyncData.value;
  }
  // エラーやローディング状態の場合はnullを返すか、適切なデフォルト値を設定
  return null;
});

//repoProviderをWatchする。
final asyncValueProvider = Provider<AsyncValue<RepoModel>>((ref) {
  return ref.watch(repoProvider);
});

final repoProvider =
    StateNotifierProvider<RepoNotifier<RepoModel>, AsyncValue<RepoModel>>(
  (ref) => RepoNotifier<RepoModel>(),
);
