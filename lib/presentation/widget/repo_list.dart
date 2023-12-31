import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/state/infinite_scrolling.dart';
import 'package:search_repo/application/types/screen_size.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/router/go_router.dart';
import 'package:search_repo/presentation/router/page_path.dart';
import 'package:search_repo/presentation/theme/color.dart';
import 'package:search_repo/presentation/theme/fonts.dart';
import 'package:search_repo/presentation/theme/screen_pod.dart';
import 'package:search_repo/presentation/widget/custom_drop_down.dart';
import 'package:search_repo/presentation/widget/custom_text.dart';
import 'package:search_repo/presentation/widget/gesture_detector/custom2_gesture_detector.dart';
import 'package:search_repo/presentation/widget/gesture_detector/custom_gesture_detector.dart';

class RepoList extends ConsumerWidget {
  final RepoModel? data;

  const RepoList({
    super.key,
    this.data,
  });

  @visibleForTesting
  static final iphoneKey = UniqueKey();

  @visibleForTesting
  static final elseKey = UniqueKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = ScreenRef(context).watch(screenProvider);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              CustomTextWidget(
                text: "${data!.totalCount} ${l10n.cases}",
                maxLine: 1,
                textStyle: CustomText.titleM,
              ),
              const Spacer(),
              const CustomDropdown(),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
          const Divider(
            height: 15,
          ),
          Expanded(
            child: ListView.separated(
              controller: ref.watch(infiniteScrollProvider),
              itemCount: data!.items.length + 1,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 15,
              ),
              itemBuilder: (BuildContext context, index) {
                if (index < data!.items.length) {
                  final ItemModel repo = data!.items[index];
                  // 条件に基づいてCustomGestureDetectorを使い分ける
                  ///スマホの場合
                  return screen.sizeClass == ScreenSizeClass.phone
                      ? CustomGestureDetector(
                          data: repo,
                          onPressed: () {
                            final router = ref.read(goRouterProvider);
                            router.pushNamed(
                              PageId.show.routeName,
                              pathParameters: {'id': repo.id.toString()},
                            );
                          },
                          key: iphoneKey,
                        )

                      ///タブレット、パソコンの場合
                      : Custom2GestureDetector(
                          data: repo,
                          onPressed: () {
                            final router = ref.read(goRouterProvider);
                            router.pushNamed(
                              PageId.show.routeName,
                            );
                          },
                          key: elseKey,
                        );
                } else if (index < 20) {
                  return const SizedBox();
                } else {
                  return const Center(
                    child: CupertinoActivityIndicator(
                      radius: 20.0,
                      color: CustomColor.gray1,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
