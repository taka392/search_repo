// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/repo.dart';
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
          RepoList(repoData: repoData),
        ],
      ),
    );
  }
}
