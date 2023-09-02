import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';

/// アプリの初期準備をする
class InitUsecase {
  InitUsecase({
    required this.repo,
    required this.repoNotifier,
  });
  final Repo repo;
  final RepoNotifier repoNotifier;

  /// 一連の流れをまとめて実施する
  Future<void> fetch() async {
    //初期値を取得
    final data = await repo.getRepo();
    //Riverpodに保存
    repoNotifier.save(data);
  }
}
