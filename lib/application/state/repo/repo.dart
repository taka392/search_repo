import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repo/domain/types/repo_model.dart';
part 'repo.g.dart';

@Riverpod(keepAlive: true)
class RepoNotifier extends _$RepoNotifier {
  @override
  Future<RepoModel> build() async {
    const initialApi = RepoModel(totalCount: 1, items: []);
    return initialApi;
  }

  Future<void> save(RepoModel data) async {
    state=AsyncValue.data(data);
  }

  Future<void> add(RepoModel data) async {
    state = AsyncValue.data(RepoModel(
      items: [...state.value!.items, ...data.items],
      totalCount: data.totalCount,
    ));
  }




}

//flutter pub run build_runner build --delete-conflicting-outputs
