import 'package:flutter/cupertino.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/domain/repo_Interface.dart';
import 'package:search_repo/domain/types/repo/repo_model.dart';
import 'package:search_repo/application/types/sort_enum.dart';

/// アプリの初期準備をする
class SortUsecase {
  SortUsecase({
    required this.repo,
    required this.sortNotifier,
    required this.repoNotifier,import 'package:flutter/cupertino.dart';
    import 'package:search_repo/application/state/repo/repo_notifier.dart';
    import 'package:search_repo/application/state/sort/sort.dart';
    import 'package:search_repo/domain/repo_Interface.dart';
    import 'package:search_repo/domain/types/repo/repo_model.dart';
    import 'package:search_repo/application/types/sort_enum.dart';

    /// アプリの初期準備をする
    class SortUsecase {
    SortUsecase({
    required this.repo,
    required this.sortNotifier,
    required this.repoNotifier,
    required this.data,
    this.scrollController,
    });

    final Repo repo;
    final SortNotifier sortNotifier;
    final RepoNotifier repoNotifier;
    final Sort data;
    final ScrollController? scrollController;

    /// 一連の流れをまとめて実施する
    Future<void> sort() async {
    //選択されたテキストで新しいリポジトリを取得
    RepoModel result = await repo.sortRepo(data);
    //リポジトリのState値を更新
    repoNotifier.save(result);
    //SortのState値を更新
    sortNotifier.save(data);
    //画面の一番上までスクロール
    if (scrollController != null) {
    await scrollController!.animateTo(
    scrollController!.position.maxScrollExtent * 0,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
    );
    }
    }
    }

    required this.data,
    this.scrollController,
  });

  final Repo repo;
  final SortNotifier sortNotifier;
  final RepoNotifier repoNotifier;
  final Sort data;
  final ScrollController? scrollController;

  /// 一連の流れをまとめて実施する
  Future<void> sort() async {
    //選択されたテキストで新しいリポジトリを取得
    RepoModel result = await repo.sortRepo(data);
    //リポジトリのState値を更新
    repoNotifier.save(result);
    //SortのState値を更新
    sortNotifier.save(data);
    //画面の一番上までスクロール
    if (scrollController != null) {
      await scrollController!.animateTo(
        scrollController!.position.maxScrollExtent * 0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
