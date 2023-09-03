import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo.dart';
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
    //以前のページ
  });
  final PageNotifier pageNotifier;
  final RepoNotifier repoNotifier;
  final SearchNotifier searchNotifier;
  final SortNotifier sortNotifier;


  /// 一連の流れをまとめて実施する
  Future<void> refresh() async {
    //pageの初期化
    pageNotifier.refresh();
    //repoの初期化
    repoNotifier.refresh();
    //searchの初期化
    searchNotifier.refresh();
    //sortの初期化
    sortNotifier.refresh();
  }
}