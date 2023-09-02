import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/domain/types/repo_model.dart';


/// アプリの初期準備をする
class AddUsecase {
  AddUsecase({
    required this.repoProviderNotifier,
    required this.newRepo,
    required this.oldRepo,//以前のページ
  });
  final RepoNotifier repoProviderNotifier;
  final RepoModel newRepo;
  final RepoModel oldRepo;

  /// 一連の流れをまとめて実施する
  Future<void> add() async {
    //pageを更新
    pageNotifier.state +=1;
    final repo = await addRepo.getRepo();//新しいリポジトリ
    //Riverpodに保存
    repoProviderNotifier.save(repo);
  }
}
