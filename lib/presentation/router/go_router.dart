import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/presentation/pages/init_page.dart';
import 'package:search_repo/presentation/pages/list_page.dart';
import 'package:search_repo/presentation/pages/show_page.dart';
import 'package:search_repo/presentation/router/page_path.dart';
import 'package:search_repo/presentation/widget/custom_transition.dart';

/// Provide GoRouter
final goRouterProvider = Provider(
  (ref) {
    final routes = [
      GoRoute(
        path: PageId.list.path,
        name: PageId.list.routeName,
        pageBuilder: (
          context,
          state,
        ) =>
            buildTransitionPage(
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
      GoRoute(
        path: PageId.show.path,
        name: PageId.show.routeName,
        pageBuilder: (context, state) => buildTransitionPage(
          child: ShowPage(data: state.pathParameters['id']!),
        ),
      ),
    ];

    return GoRouter(
      //初回のルーティングをinitialLocationに記述しました。
      initialLocation: PageId.init.path,
      routes: routes,
    );
  },
);
