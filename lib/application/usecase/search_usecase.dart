// ignore_for_file: unrelated_type_equality_checks, avoid_dynamic_calls

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
    final data = await repo.searchRepo(text);
    //ネットワークの接続状況を確認
    final isNetError = await Network.check();
    if (isNetError) {
      repoNotifier.errorText();
    } else {
      //新しいrepoを取得
      if (data is RepoModel) {
        repoNotifier.save(data);
        debugPrint(data.toString());
      }
      //SearchのStateを更新
      searchNotifier.update(text);
      //page番号を初期化
      pageNotifier.refresh();

      //dataの値をチェック
      const noFind = "totalCount: 0";
      bool checkItemCount(String data, String keyword) {
        return data.contains(keyword);
      }

      //ListViewにScrollControllerが入っているか判定。
      final bool value = checkItemCount(data.toString(), noFind);
      //画面の1番上までスクロール
      if (scrollController != null && !value) {
        await AnimationUtil.scroll(scrollController, 0);
      }
    }
  }
}
