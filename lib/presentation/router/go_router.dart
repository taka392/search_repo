import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/state/l10n/applocalizatons_provider.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/presentation/pages/init_page.dart';
import 'package:search_repo/presentation/pages/list_page.dart';
import 'package:search_repo/presentation/router/page_path.dart';
import 'package:search_repo/presentation/widget/custom_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
/// Provide GoRouter
final goRouterProvider = Provider(
  (ref) {
    final repoData = ref.watch(repoNotifierProvider);
    ScrollController scrollController =ScrollController();
    AppLocalizations locate = ref.watch(appLocalizationsProvider);
    final routes = [
      GoRoute(
        path: PageId.list.path,
        name: PageId.list.routeName,
        pageBuilder: (context, state) => buildTransitionPage(
          child: ListPage(
            repoData: repoData,
            scrollController: scrollController,
            locate: locate,
          ),
        ),
      ),
      GoRoute(
        path: PageId.init.path,
        name: PageId.init.routeName,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const InitPage(),
        ),
      ),
      GoRoute(
        path: PageId.show.path,
        name: PageId.show.routeName,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const InitPage(),
        ),
      ),
    ];

    return GoRouter(
      initialLocation: PageId.init.path,
      debugLogDiagnostics: false,
      routes: routes,
    );
  },
);
