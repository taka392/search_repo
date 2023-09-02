import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/widget/custom_animation.dart';
import 'package:search_repo/presentation/widget/custom_gesture_detector.dart';
class RepoList extends StatelessWidget {
  final AsyncValue<RepoModel> repoData;
  final VoidCallback onPressed;

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
      return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {

          }
          return false;
        },
        child: ListView.builder(
          itemCount: data.items.length,
          itemBuilder: (_, index) {
            final item = data.items[index];
            return CustomGestureDetector(
              data: item,
              onPressed: () {},
            );
          },
        ),
      );
    }

    Widget repoList = repoData.when(

        loading: () => CustomAnimation(imageUrl: 'assets/lottie/loading.json', text: 'ローディング', onRefresh: ()async{}, key: loadingKey),
        error: (e, s) => CustomAnimation(imageUrl: 'assets/lottie/error.json', text: 'エラー $e', onRefresh: ()async{}, key: errorKey),
        data: (data){
          if (data.totalCount == 0) {
            return CustomAnimation(imageUrl: 'assets/lottie/not_found.json', text: 'ヒットがありません', onRefresh: ()async{}, key: noHitKey);
          }else {
            return buildListView(data);
          }
        }
    );
    return repoList;
  }
}
