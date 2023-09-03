import 'package:flutter/material.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';



/// アプリの初期準備をする
class AddUsecase {
  AddUsecase({
    required this.repo,
    required this.pageNotifier,
    required this.repoNotifier,
    required this.controller,
    //以前のページ
  });
  final Repo repo;
  final PageNotifier pageNotifier;
  final RepoNotifier repoNotifier;
  final ScrollController? controller;


  /// 一連の流れをまとめて実施する
  Future<void> search() async {
    //検索結果を受け取る
    //検索結果を元にRepoを取得
    //Stateに保存する。
  }
}