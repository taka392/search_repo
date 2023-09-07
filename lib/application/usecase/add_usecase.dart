import 'package:flutter/material.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';



/// アプリの初期準備をする
class AddUsecase {
  AddUsecase({
    required this.repo,
    required this.repoNotifier,
    this.scrollController,
    required this.pageNotifier,
    //以前のページ
  });
  final Repo repo;
  final RepoNotifier repoNotifier;
  final ScrollController? scrollController;
  final PageNotifier pageNotifier;


  /// 一連の流れをまとめて実施する
  Future<void> add() async {
    //新しいリポジトリを取得
    RepoModel data = await repo.addRepo();
    //Riverpodに保存
    repoNotifier.add(data);
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
