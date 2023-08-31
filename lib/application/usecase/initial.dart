import 'package:search_repo/application/di/repo_di.dart';
import 'package:search_repo/application/state/repo.dart';

/// アプリの初期準備をする
class InitAppUsecase {
  InitAppUsecase({
    required this.initialFetch,
    required this.repoProviderNotifier,
  });
  final RepositoryImpl initialFetch;
  final RepoNotifier repoProviderNotifier;

  /// 一連の流れをまとめて実施する
  Future<void> fetch() async {
    //初期値を取得
    final repo = await initialFetch.getPosts();
    //Riverpodに保存
    repoProviderNotifier.save(repo);
  }
}
