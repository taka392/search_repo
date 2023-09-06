


import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/domain/types/repo_model.dart';

class RepoNotifier extends StateNotifier<RepoModel> {
  RepoNotifier(
      /// 初期値
      RepoModel initialList,
      ) : super(initialList);

  Future<void> save(RepoModel data) async {
    state=AsyncValue.data(data) as RepoModel;
  }

  Future<void> add(RepoModel data) async {
    state = AsyncValue.data(RepoModel(
      items: [...state.items, ...data.items],
      totalCount: data.totalCount,
    )) as RepoModel;
  }
  void refresh(){
    state= const AsyncValue.data(RepoModel(items: [],totalCount: 1)) as RepoModel;
  }
  void setLoading(){
    state= const AsyncValue<RepoModel>.loading() as RepoModel;
  }

}
