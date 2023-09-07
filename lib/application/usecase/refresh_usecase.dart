import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';



/// アプリの初期準備をする
class RefreshUsecase {
  RefreshUsecase({
    required this.pageNotifier,
    required this.repoNotifier,
    required this.searchNotifier,
    required this.sortNotifier,
    required this.repo,
    //以前のページ
  });
  final PageNotifier pageNotifier;
  final RepoNotifier repoNotifier;
  final SearchNotifier searchNotifier;
  final SortNotifier sortNotifier;
  final Repo repo;


  /// 一連の流れをまとめて実施する
  Future<void> refresh() async {
    //リポジトリを初期化
    RepoModel data = await repo.getRepo();
    //リポジトリをStateに保存
    repoNotifier.save(data);
    //pageの初期化
    pageNotifier.refresh();
    //searchの初期化
    searchNotifier.refresh();
    //sortの初期化
    sortNotifier.refresh();
  }
}