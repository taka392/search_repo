import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/domain/interface.dart';
import 'package:search_repo/domain/types/repo/repo_model.dart';
import 'package:search_repo/application/types/sort_enum.dart';
/// アプリの初期準備をする
class TestUsecase {
  TestUsecase({
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
  Future<void> test(RepoModel data,int page,String search,Sort sort) async {
    //テスト時にMockデータを代入し、stateに保存する。
    repoNotifier.save(data);
    //pageの初期化
    pageNotifier.save(page);
    //searchの初期化
    searchNotifier.save(search);
    //sortの初期化
    sortNotifier.save(sort);
  }
}