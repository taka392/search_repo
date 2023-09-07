


import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/domain/types/repo_model.dart';

class RepoNotifier extends StateNotifier<AsyncValue<RepoModel>> {
  RepoNotifier() : super(const AsyncValue.loading());

  Future<void> save(RepoModel data) async {
    state = AsyncValue.data(data);
  }

  Future<void> add(RepoModel data) async {
    state = state.when(
      data: (repoModel) {
        return AsyncValue.data(RepoModel(
          items: [...repoModel.items, ...data.items],
          totalCount: data.totalCount,
        ));
      },
      loading: () => state,
      error: (error, stackTrace) => state,
    );
  }

  void refresh() {
    state = const AsyncValue.loading();
  }
  void loadingText(){
    state = const AsyncValue.loading();
  }

}


