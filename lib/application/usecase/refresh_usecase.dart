import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/domain/repo_Interface.dart';
import 'package:search_repo/domain/types/repo/repo_model.dart';

/// アプリの初期準備をする
class RefreshUsecase {
  RefreshUsecase({
    required this.pageNotifier,
    required this.repoNotifier,
    required this.searchNotifier,
    required this.sortNotifier,
    required this.repo,
  });

  final PageNotifier pageNotifier;
  final RepoNotifier repoNotifier;
  final SearchNotifier searchNotifier;
  final SortNotifier sortNotifier;
  final Repo repo;

  /// 一連の流れをまとめて実施する
  Future<void> refresh() async {
    //リポジトリを初期化
    RepoModel data = await repo.refreshRepo();
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
