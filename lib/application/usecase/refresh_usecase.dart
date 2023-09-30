import 'package:search_repo/application/interfaces/repo.dart';
import 'package:search_repo/application/logic/network.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/domain/types/repo_model.dart';

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
    final isNetError = await Network.check();
    if (isNetError) {
      repoNotifier.errorText();
    } else {
      final data = await repo.refreshRepo();
      if (data is RepoModel) {
        repoNotifier.save(data);
      }
      //pageの初期化
      pageNotifier.refresh();
      //searchの初期化
      searchNotifier.refresh();
      //sortの初期化
      sortNotifier.refresh();
    }
  }
}
