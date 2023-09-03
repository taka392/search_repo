import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/presentation/widget/repo_list.dart';
import 'package:search_repo/presentation/widget/sarch_app_bar.dart';

class ListPage extends HookConsumerWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repoData = ref.watch(repoNotifierProvider);
    final controller = useScrollController();

    useEffect(() {
      //init
      final usecase = ref.read(initAppProvider);
      usecase.init();
      return null;
    }, const []);
    return Scaffold(
      appBar: SearchAppBar(),
      body: RepoList(
        repoData: repoData,
        onPressed: () async {},
        controller: controller,
      ),
    );
  }
}
