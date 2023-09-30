import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/application/di/usecases.dart';
import 'package:search_repo/application/state/l10n/applocalizatons_provider.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/presentation/widget/custom_animation.dart';
import 'package:search_repo/presentation/widget/repo_list.dart';
import 'package:search_repo/presentation/widget/search_app_bar.dart';

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  @visibleForTesting
  static final loadingKey = UniqueKey();

  @visibleForTesting
  static final errorKey = UniqueKey();

  @visibleForTesting
  static final noHitKey = UniqueKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locate = ref.watch(appLocalizationsProvider);
    final repoData = ref.watch(asyncValueProvider);
    return Scaffold(
      appBar: const SearchAppBar(),
      body: repoData.when(
        error: (e, s) {
          ///ネットワークエラーの時の条件分岐
          if (e == "ネットワークエラー") {
            return CustomAnimation(
              imageUrl: 'assets/lottie/error.json',
              text: locate.net_error,
              description1: locate.net_error_description1,
              description2: locate.net_error_description2,
              onReload: () async {
                final usecase = ref.read(refreshProvider);
                usecase.refresh();
              },
              hasFloating: true,
              error: "$e",
              stackTrace: "$s",
              key: errorKey,
            );
          } else {
            ///エラーの時の条件分岐
            return CustomAnimation(
              imageUrl: 'assets/lottie/error.json',
              text: locate.error,
              description1: "$e",
              description2: "$s",
              onReload: () async {
                final usecase = ref.read(refreshProvider);
                usecase.refresh();
              },
              hasFloating: true,
              key: errorKey,
            );
          }
        },
        loading: () => CustomAnimation(
          imageUrl: 'assets/lottie/loading.json',
          text: locate.searching,
          onReload: () async {
            final usecase = ref.read(refreshProvider);
            usecase.refresh();
          },
          key: loadingKey,
        ),
        data: (data) {
          if (data.totalCount == 0) {
            return CustomAnimation(
              imageUrl: 'assets/lottie/not_found.json',
              text: locate.noHit,
              onReload: () async {
                final usecase = ref.read(refreshProvider);
                usecase.refresh();
              },
              description1: locate.noHit_description,
              key: noHitKey,
            );
          } else {
            return RepoList(
              data: data,
            );
          }
        },
      ),
    );
  }
}
