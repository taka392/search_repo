import 'package:flutter/material.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';



/// アプリの初期準備をする
class SearchUsecase {
  SearchUsecase({
    required this.repo,
    required this.search,
    required this.searchNotifier,
    required this.repoNotifier,
    //以前のページ
  });
  final Repo repo;
  final String search;
  final PageNotifier searchNotifier;
  final RepoNotifier repoNotifier;


  /// 一連の流れをまとめて実施する
  Future<void> search() async {
    //検索結果を保存
    //検索結果を元にRepoを取得
    //検索結果を保存する
    //Stateに保存する。
  }
}