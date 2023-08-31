// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/repo.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/widget/custom_animation.dart';
import 'package:search_repo/presentation/widget/custom_gesture_detector.dart';

class ListPage extends HookConsumerWidget {
  final VoidCallback repoData;
  const ListPage({Key? key,required this.repoData}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(repoNotifierProvider);

    useEffect(() {
      final usecase = ref.read(initAppProvider);
      usecase.fetch();
      return null;
    }, const []);

    Widget _buildListView(RepoModel data) {
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


/*    Widget repoList = repo.when(
      loading: () =>
      error: (e, s) => Text('エラー $e'),
      data: (data){
        if (data.totalCount == 0) {
          return const Text("ヒットするものがありません");
        }else {
          return _buildListView(data);
        }
      }
    );*/

    return Scaffold(
      appBar: AppBar(title: const Text('List Page')),
      body: CustomAnimation(imageUrl: 'assets/lottie/loading.json', text: 'ローディング中...', onPressed: () {}),

  /*  repoList,*/
    );
  }
}
