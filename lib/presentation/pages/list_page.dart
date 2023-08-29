import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/useusecase.dart';
import 'package:search_repo/application/state/repo.dart';
import 'package:search_repo/domain/types/repo_model.dart';

class ListPage extends HookConsumerWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(repoNotifierProvider); // StateProviderから状態を取得

    useEffect(() {
      // スプラッシュ画面がないのでここで初期化
      final usecase = ref.read(initAppProvider);
      usecase.fetch();
      return null;
    }, const []);


    Widget repoList = repo.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (data){
        if (data.totalCount == 0) {
          return const Text("ヒットするものがありません");
        }else {
          return _buildListView(data);
        }
      }
    );

    return Scaffold(
      appBar: AppBar(title: Text('List Page')),
      body: repoList,
    );
  }

  Widget _buildListView(RepoModel data) {
    return ListView.builder(
      itemCount: data.items.length,
      itemBuilder: (_, index) {
        final item = data.items[index];
        return Card(
          child: ListTile(
            title: Text(item.name), // 例: リポジトリ名を表示
            subtitle: Text(item.description ?? ''), // 例: 説明を表示
          ),
        );
      },
    );
  }
}
