import 'package:flutter/cupertino.dart';
import 'package:search_repo/application/interfaces/repo.dart';
import 'package:search_repo/application/logic/animation.dart';
import 'package:search_repo/application/logic/network.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/application/types/sort_enum.dart';
import 'package:search_repo/domain/types/repo_model.dart';

/// アプリの初期準備をする
class SortUsecase {
  SortUsecase({
    required this.repo,
    required this.sortNotifier,
    required this.repoNotifier,
    required this.data,
    this.scrollController,
    //以前のページ
  });

  final Repo repo;
  final SortNotifier sortNotifier;
  final RepoNotifier repoNotifier;
  final Sort data;
  final ScrollController? scrollController;

  /// 一連の流れをまとめて実施する
  Future<void> sort() async {
    //ネットワークの接続状況を確認
    final isNetError = await Network.check();
    if (isNetError) {
      repoNotifier.errorText();
    } else {
      //選択されたテキストで新しいリポジトリを取得
      final result = await repo.sortRepo(data);
      if (result is RepoModel) {
        repoNotifier.save(result);
      }
      //SortのState値を更新
      sortNotifier.save(data);
      //スクロールアニメーション実行
      if (scrollController != null) {
        AnimationUtil.scroll(scrollController, 0);
      }
    }
  }
}
