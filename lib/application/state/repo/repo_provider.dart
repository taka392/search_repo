import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/domain/types/repo_model.dart';

/// メモ一覧のプロバイダー
final repoProvider = NotifierProvider<RepoNotifier, RepoModel>(
      RepoNotifier.new;
);


class RepoNotifier extends StateNotifier<AsyncValue<RepoModel>> {

  RepoNotifier(AsyncValue<RepoModel> state) : super(state);

  Future<void> fetchData() async {
    try {
      // データの取得を開始し、状態を"loading"に変更
      state = AsyncValue.loading();

      // 非同期処理を実行してデータを取得
      final repoModel = await repository.fetchData();

      // データの取得が成功した場合、状態を"data"に変更
      state = AsyncValue.data(repoModel);
    } catch (error) {
      // エラーが発生した場合、状態を"error"に変更
      state = AsyncValue.error(error);
    }
  }
}
