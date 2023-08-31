import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repo/domain/types/repo_model.dart';
part 'repo.g.dart';

@riverpod
class RepoNotifier extends _$RepoNotifier {
  @override
  Future<RepoModel> build() async {
    const initialApi = RepoModel(totalCount: 1, items: []);
    return initialApi;
  }

  Future<void> save(RepoModel data) async {
    state=AsyncValue.data(data);
  }
}

//flutter pub run build_runner build --delete-conflicting-outputs
