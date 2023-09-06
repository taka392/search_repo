import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/l10n/applocalizatons_provider.dart';
import 'package:search_repo/presentation/router/go_router.dart';
import 'package:search_repo/presentation/router/page_path.dart';
class InitPage extends HookConsumerWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final locate = ref.watch(appLocalizationsProvider);
    useEffect(() {
      void navigateToNextPage() async {
        final usecase = ref.read(initAppProvider);
        await usecase.init(); // 非同期処理が完了するまで待つ
        final router = ref.read(goRouterProvider);
        router.pushNamed(
          PageId.list.routeName,
        );
      }
      navigateToNextPage(); // 非同期関数を呼び出す
      return null;
    }, const []);

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/loading.json'),
              Text(locate.searching),
            ],
          ),
        ),
      ),
    );
  }
}
