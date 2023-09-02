import 'package:search_repo/application/di/repo_di.dart';
import 'package:search_repo/application/state/repo/repo.dart';

/// アプリの初期準備をする
class AddUsecase {
  AddUsecase({
    required this.addRepo,
    required this.repoProviderNotifier,
  });
  final RepositoryImpl addRepo;
  final RepoNotifier repoProviderNotifier;

  /// 一連の流れをまとめて実施する
  Future<void> add() async {
    //初期値を取得
    final repo = await addRepo.getRepo();
    //Riverpodに保存
    repoProviderNotifier.save(repo);
  }
}
