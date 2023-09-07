


import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/domain/types/repo_model.dart';

class RepoNotifier extends StateNotifier<AsyncValue<RepoModel>> {
  RepoNotifier(AsyncValue<RepoModel> state) : super(state);

  Future<void> save(RepoModel data) async {
    state = AsyncValue.data(data);
  }

  Future<void> add(RepoModel data) async {
    state = AsyncValue.data(RepoModel(
      items: [...(state.value?.items ?? []), ...data.items],
      totalCount: data.totalCount,
    ));
  }

  void refresh() {
    state = const AsyncValue.data(RepoModel(items: [], totalCount: 1));
  }

  void setLoading() {
    state = const AsyncValue<RepoModel>.loading();
  }
}
