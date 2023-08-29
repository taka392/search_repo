import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/useusecase.dart';
import 'package:search_repo/application/state/repo.dart';

// 例: StateProviderを使用した状態管理
final counterProvider = StateProvider<int>((ref) => 0);

class ListPage extends HookConsumerWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(repoNotifierProvider); // StateProviderから状態を取得

    useEffect(() {
      // スプラッシュ画面がないのでここで初期化
      final usecase = ref.read(initAppProvider);
      usecase.fetch();
      return null;
    }, const []);

    final s3Text = repo.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (d) => Text(d.toString()),
    );



    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        s3Text,
      ],
    );
  }
}


