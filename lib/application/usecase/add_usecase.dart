import 'package:search_repo/application/di/repo_di.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/domain/types/repo_model.dart';



/// アプリの初期準備をする
class AddUsecase {
  AddUsecase({
    required this.pageNotifier,
    required this.repo,
    required this.repoNotifier,
    //以前のページ
  });
  final PageNotifier pageNotifier;
  final RepositoryImpl repo;
  final RepoNotifier repoNotifier;


  /// 一連の流れをまとめて実施する
  Future<void> add() async {
    //ページを更新
    pageNotifier.update();
    //新しいリポジトリを取得
    RepoModel data = await repo.getRepo();
    //Riverpodに保存
    repoNotifier.add(data);
  }
}
