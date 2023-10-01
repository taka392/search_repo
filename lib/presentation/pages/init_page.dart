import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:search_repo/application/di/usecases.dart';
import 'package:search_repo/application/state/l10n.dart';
import 'package:search_repo/presentation/router/go_router.dart';
import 'package:search_repo/presentation/router/page_path.dart';
import 'package:search_repo/presentation/widget/search_app_bar.dart';

class InitPage extends HookConsumerWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider(context));

    useEffect(
      () {
        Future<void> navigateToNextPage() async {
          //初期化処理
          final usecase = ref.read(refreshProvider);
          await usecase.refresh();
          //ListPageへ遷移します。
          final router = ref.read(goRouterProvider);
          router.pushNamed(
            PageId.list.routeName,
          );
        }

        navigateToNextPage();
        return null;
      },
      const [],
    );

    return Scaffold(
      appBar: const SearchAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/loading.json'),
            Text(l10n.searching),
          ],
        ),
      ),
    );
  }
}
