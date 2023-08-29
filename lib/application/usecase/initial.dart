import 'package:search_repo/application/state/repo.dart';
import 'package:search_repo/domain/types/repo_abstract.dart';

/// アプリの初期準備をする
class InitAppUsecase {
  InitAppUsecase({
    required this.postRepositoryImpl,
    required this.repoProviderNotifier,
  });
  final PostRepository postRepositoryImpl;
  final RepoNotifier repoProviderNotifier;

  /// 一連の流れをまとめて実施する
  Future<void> fetch() async {
    //初期値を取得
    final repo = await postRepositoryImpl.getPosts();
    //Riverpodに保存
    repoProviderNotifier.save(repo);
  }
}
