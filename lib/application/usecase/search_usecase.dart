import 'package:flutter/cupertino.dart';
import 'package:search_repo/application/interfaces/repo.dart';
import 'package:search_repo/application/logic/animation.dart';
import 'package:search_repo/application/logic/network.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/domain/types/repo_model.dart';

/// アプリの初期準備をする
class SearchUsecase {
  SearchUsecase({
    required this.repo,
    required this.text,
    required this.searchNotifier,
    required this.repoNotifier,
    required this.pageNotifier,
    this.scrollController,
  });

  final Repo repo;
  final String text;
  final SearchNotifier searchNotifier;
  final RepoNotifier repoNotifier;
  final PageNotifier pageNotifier;
  final ScrollController? scrollController;

  /// 一連の流れをまとめて実施する
  Future<void> search() async {
    //ネットワークの接続状況を確認
    final isNetError = await Network.check();
    if (isNetError) {
      repoNotifier.errorText();
    } else {
      final data = await repo.searchRepo(text);
      //新しいrepoを取得
      if (data is RepoModel) {
        repoNotifier.save(data);
      }
      //SearchのStateを更新
      searchNotifier.update(text);
      //page番号を初期化
      pageNotifier.refresh();
    }
    //画面の1番上までスクロール
    if (scrollController != null) {
      AnimationUtil.scroll(scrollController, 0);
    }
  }
}
