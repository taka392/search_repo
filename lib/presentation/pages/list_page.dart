import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/presentation/widget/repo_list.dart';

class ListPage extends HookConsumerWidget {

  const ListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repoData = ref.watch(repoNotifierProvider);

    useEffect(() {
      final usecase = ref.read(initAppProvider);
      usecase.fetch();
      return null;
    }, const []);

    return Scaffold(
      appBar: AppBar(title: const Text('List Page')),
      body: Column(
        children: [
          Expanded(child: RepoList(repoData: repoData)),
        ],
      ),
    );
  }
}
