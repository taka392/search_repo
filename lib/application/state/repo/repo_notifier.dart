


import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/domain/types/repo_model.dart';

class RepoNotifier extends StateNotifier<CustomAsyncValue<RepoModel>> {
  RepoNotifier() : super(CustomAsyncValue<RepoModel>(
    data: const RepoModel(items: [], totalCount: 1),
  ));

  Future<void> save(RepoModel data) async {
    state = CustomAsyncValue<RepoModel>(data: data);
  }

  Future<void> add(RepoModel data) async {
    state = CustomAsyncValue<RepoModel>(
      data: RepoModel(
        items: [...(state.data?.items ?? []), ...data.items],
        totalCount: data.totalCount,
      ),
    );
  }

  void refresh() {
    state = CustomAsyncValue<RepoModel>(
      data: const RepoModel(items: [], totalCount: 1),
    );
  }
}
