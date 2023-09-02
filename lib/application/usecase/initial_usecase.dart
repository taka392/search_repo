import 'package:search_repo/application/di/repo_di.dart';
import 'package:search_repo/application/state/repo/repo.dart';

/// アプリの初期準備をする
class InitUsecase {
  InitUsecase({
    required this.repo,
    required this.repoProviderNotifier,
  });
  final RepositoryImpl repo;
  final RepoNotifier repoProviderNotifier;

  /// 一連の流れをまとめて実施する
  Future<void> fetch() async {
    //初期値を取得
    final data = await repo.getRepo();
    //Riverpodに保存
    repoProviderNotifier.save(data);
  }
}
