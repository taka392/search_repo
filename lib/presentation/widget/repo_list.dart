import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/widget/custom_gesture_detector.dart';
class RepoList extends StatelessWidget {
  final AsyncValue<RepoModel> repoData;
  const RepoList({super.key,required this.repoData});

  @override
  Widget build(BuildContext context) {

    Widget buildListView(RepoModel data) {
      return ListView.builder(
        itemCount: data.items.length,
        itemBuilder: (_, index) {
          final item = data.items[index];
          return CustomGestureDetector(
            data: item,
            onPressed: () {},
          );
        },
      );
    }

    Widget repoList = repoData.when(
        loading: () =>const Text('ローディング'),
        error: (e, s) => Text('エラー $e'),
        data: (data){
          if (data.totalCount == 0) {
            return const Text("ヒットするものがありません");
          }else {
            return buildListView(data);
          }
        }
    );
    return Scaffold(
      body: repoList,
    );
  }
}
