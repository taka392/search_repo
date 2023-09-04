import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';



/// アプリの初期準備をする
class SortUsecase {
  SortUsecase({
    required this.repo,
    required this.searchText,
    required this.searchNotifier,
    required this.repoNotifier,
    //以前のページ
  });
  final Repo repo;
  final String searchText;
  final SearchNotifier searchNotifier;
  final RepoNotifier repoNotifier;


  /// 一連の流れをまとめて実施する
  Future<void> search() async {
    //新しいrepoを取得
    RepoModel data = await repo.getRepo();
    //SearchのStateを更新
    searchNotifier.update(searchText);
    //新しくRepoを取得

    //検索結果をStateに保存
    repoNotifier.save(data);
  }
}