import 'package:search_repo/application/di/repo_di.dart';
import 'package:search_repo/application/state/repo.dart';

/// アプリの初期準備をする
class InitUsecase {
  InitUsecase({
    required this.initRepo,
    required this.repoProviderNotifier,
  });
  final RepositoryImpl initRepo;
  final RepoNotifier repoProviderNotifier;

  /// 一連の流れをまとめて実施する
  Future<void> fetch() async {
    //初期値を取得
    final repo = await initRepo.getRepo();
    //Riverpodに保存
    repoProviderNotifier.save(repo);
  }
}
