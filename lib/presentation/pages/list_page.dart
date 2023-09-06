import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/l10n/applocalizatons_provider.dart';
import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/widget/custom_animation.dart';
import 'package:search_repo/presentation/widget/repo_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListPage extends HookConsumerWidget {
  const ListPage({Key? key}) : super(key: key);


  @visibleForTesting
  static final loadingKey = UniqueKey();
  @visibleForTesting
  static final errorKey = UniqueKey();
  @visibleForTesting
  static final noHitKey = UniqueKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController scrollController =ScrollController();
    AppLocalizations locate = ref.watch(appLocalizationsProvider);
    final repoData = ref.watch(repoProvider);

    return Scaffold(
      body: repoData.when(
        loading: () => CustomAnimation(
          imageUrl: 'assets/lottie/loading.json',
          text: locate.searching,
          onRefresh: () async {
            /*final usecase = ref.read(refreshProvider);
            usecase.refresh();*/
          },
          key: loadingKey,
        ),
        error: (e, s) => CustomAnimation(
          imageUrl: 'assets/lottie/error.json',
          text: locate.error,
          onRefresh: () async {
            /*final usecase = ref.read(refreshProvider);
            usecase.refresh();*/
          },
          key: errorKey,
        ),
        data: (data) {
          if (data.totalCount == 0) {
            return CustomAnimation(
              imageUrl: 'assets/lottie/not_found.json',
              text: locate.noHit,
              onRefresh: () async {
                /*final usecase = ref.read(refreshProvider);
                usecase.refresh();*/
              },
              key: noHitKey,
            );
          } else {
            return RepoList(
              scrollController: scrollController,
              data: data,
            );
          }
        },
      ),
    );
  }
}
