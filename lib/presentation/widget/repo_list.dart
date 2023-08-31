import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/widget/custom_animation.dart';
import 'package:search_repo/presentation/widget/custom_gesture_detector.dart';
class RepoList extends StatelessWidget {
  final AsyncValue<RepoModel> repoData;
  const RepoList({super.key,required this.repoData});
  @visibleForTesting
  static final loadingKey = UniqueKey();
  @visibleForTesting
  static final errorKey = UniqueKey();
  @visibleForTesting
  static final noHitKey = UniqueKey();
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
        /*loading: () =>Text('ローディング',key: loadingKey),*/
        loading: () => CustomAnimation(imageUrl: imageUrl, text: text, onPressed: (){}, key: errorKey,)
        error: (e, s) => Text('エラー $e',key: errorKey),
        data: (data){
          if (data.totalCount == 0) {
            return Text("ヒットするものがありません",key: noHitKey);
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
