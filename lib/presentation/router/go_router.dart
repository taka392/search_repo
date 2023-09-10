import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/presentation/pages/init_page.dart';
import 'package:search_repo/presentation/pages/list_page.dart';
import 'package:search_repo/presentation/router/page_path.dart';
import 'package:search_repo/presentation/widget/custom_transition.dart';
/// Provide GoRouter
final goRouterProvider = Provider(
  (ref) {
    final routes = [
      GoRoute(
        path: PageId.list.path,
        name: PageId.list.routeName,
        pageBuilder: (context, state,) => buildTransitionPage(
          child: const ListPage(),
        ),
      ),
      GoRoute(
        path: PageId.init.path,
        name: PageId.init.routeName,
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
