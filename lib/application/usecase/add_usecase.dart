import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:search_repo/application/interfaces/repo.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/domain/types/repo_model.dart';

/// アプリの初期準備をする
class AddUsecase {
  AddUsecase({
    required this.repo,
    required this.repoNotifier,
    this.scrollController,
    required this.pageNotifier,
    required this.connectivity,
  });

  final Repo repo;
  final RepoNotifier repoNotifier;
  final ConnectivityResult connectivity;

  //ListViewにセットしたScrollControllerのインスタンスを取得。
  final ScrollController? scrollController;
  final PageNotifier pageNotifier;

  /// 一連の流れをまとめて実施する
  Future<void> add() async {
    //新しいリポジトリを取得
    if (connectivity != ConnectivityResult.none) {
      repoNotifier.errorText();
    } else {
      final data = await repo.addRepo();
      if (data is RepoModel) {
        await repoNotifier.add(data);
      }
      //ページ番号を更新
      pageNotifier.update();
    }
  }
}
