import 'package:search_repo/application/di/post_repo_imt.dart';
import 'package:search_repo/application/state/repo.dart';
import 'package:search_repo/domain/types/repo_model.dart';

/// アプリの初期準備をする
class InitAppUsecase {
  InitAppUsecase({
    required this.postRepositoryImpl,
    required this.repoProviderNotifier,
  });
  final PostRepositoryImpl postRepositoryImpl;
  final RepoNotifier repoProviderNotifier;

  /// 一連の流れをまとめて実施する
  Future<void> fetch() async {
    //初期値を取得
    final repo =postRepositoryImpl.getPosts();
    //Riverpodに保存
    repoProviderNotifier.save(repo as RepoModel);
  }
}
