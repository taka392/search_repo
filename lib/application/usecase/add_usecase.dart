import 'package:flutter/material.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/domain/interface.dart';
import 'package:search_repo/domain/types/repo/repo_model.dart';

/// アプリの初期準備をする
class AddUsecase {
  AddUsecase({
    required this.repo,
    required this.repoNotifier,
    this.scrollController,
    required this.pageNotifier,
  });

  final Repo repo;
  final RepoNotifier repoNotifier;

  //ListViewにセットしたScrollControllerのインスタンスを取得。
  final ScrollController? scrollController;
  final PageNotifier pageNotifier;

  /// 一連の流れをまとめて実施する
  Future<void> add() async {
    //新しいリポジトリを取得
    RepoModel data = await repo.addRepo();
    //Riverpodに保存
    await repoNotifier.add(data);
    //ページ番号を更新
    pageNotifier.update();
    //スクロールアニメーションを実行
    if (scrollController != null) {
      await scrollController!.animateTo(
        scrollController!.position.maxScrollExtent * 0.9,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
