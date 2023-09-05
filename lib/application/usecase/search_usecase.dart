import 'package:flutter/cupertino.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';



/// アプリの初期準備をする
class SearchUsecase {
  SearchUsecase({
    required this.repo,
    required this.searchText,
    required this.searchNotifier,
    required this.repoNotifier,
    required this.pageNotifier,
    this.scrollController,
    //以前のページ
  });
  final Repo repo;
  final String searchText;
  final SearchNotifier searchNotifier;
  final RepoNotifier repoNotifier;
  final PageNotifier pageNotifier;
  final ScrollController? scrollController;



  /// 一連の流れをまとめて実施する
  Future<void> search() async {
    //新しいrepoを取得
    RepoModel data = await repo.getRepo();
    //SearchのStateを更新
    searchNotifier.update(searchText);
    //page番号を初期化
    pageNotifier.refresh();
    //検索結果をStateに保存
    repoNotifier.save(data);

    if (scrollController != null) {
      await scrollController!.animateTo(
        scrollController!.position.maxScrollExtent * 0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
    }
}