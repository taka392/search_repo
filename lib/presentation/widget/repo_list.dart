
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/domain/types/item_model.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/theme/color.dart';
import 'package:search_repo/presentation/theme/fonts.dart';
import 'package:search_repo/presentation/widget/custom_animation.dart';
import 'package:search_repo/presentation/widget/custom_drop_down.dart';
import 'package:search_repo/presentation/widget/custom_gesture_detector.dart';
import 'package:search_repo/presentation/widget/custom_text.dart';
import 'package:search_repo/presentation/widget/search_app_bar.dart';

class RepoList extends HookConsumerWidget {
  final AsyncValue<RepoModel> repoData;
  final VoidCallback onPressed;
  final ScrollController scrollController;

  const RepoList(
      {Key? key,
      required this.repoData,
      required this.onPressed,
      required this.scrollController})
      : super(key: key);

  @visibleForTesting
  static final loadingKey = UniqueKey();
  @visibleForTesting
  static final errorKey = UniqueKey();
  @visibleForTesting
  static final noHitKey = UniqueKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final scrollController = useScrollController();

    void scroll() async {
      if (!isLoading.value &&
          scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
        isLoading.value = true;
        final usecase = ref.read(addAppProvider(scrollController));
        await usecase.add();
        final page = ref.read(pageNotifierProvider);
        debugPrint(page.toString());
        isLoading.value = false;
      }
    }

    useEffect(() {
      scrollController.addListener(scroll);
      return () {
        scrollController.removeListener(scroll);
        scrollController.dispose();
      };
    }, const []);

    Widget listView(RepoModel data) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              CustomTextWidget(
                text: "${data.totalCount.toString()}件",
                maxLine: 1,
                textStyle: CustomText.titleM,
              ),
              const Spacer(),
              CustomDropdown(
                scrollController: scrollController,
              ),
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
              controller: scrollController,
              itemCount: data.items.length + 1,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 15,
              ),
              itemBuilder: (BuildContext context, index) {
                if (index < data.items.length) {
                  ItemModel repo = data.items[index];
                  return CustomGestureDetector(data: repo, onPressed: () {});
                } else {
                  return const Center(
                      child: CupertinoActivityIndicator(
                    radius: 20.0,
                    color: CustomColor.gray1,
                  ));
                }
              },
            ),
          ),
        ],
      );
    }

    Widget repoList = repoData.when(
        loading: () => CustomAnimation(
            imageUrl: 'assets/lottie/loading.json',
            text: 'ローディング',
            onRefresh: () async {
              final usecase = ref.read(refreshProvider);
              usecase.refresh();
            },
            key: loadingKey),
        error: (e, s) => CustomAnimation(
            imageUrl: 'assets/lottie/error.json',
            text: 'エラー $e',
            onRefresh: () async {
              final usecase = ref.read(refreshProvider);
              usecase.refresh();
            },
            key: errorKey),
        data: (data) {
          if (data.totalCount == 0) {
            return CustomAnimation(
                imageUrl: 'assets/lottie/not_found.json',
                text: 'ヒットがありません',
                onRefresh: () async {
                  final usecase = ref.read(refreshProvider);
                  usecase.refresh();
                },
                key: noHitKey);
          } else {
            return listView(data);
          }
        });
    return Scaffold(
      appBar: SearchAppBar(
        scrollController: scrollController,
      ),
      body: repoList,
    );
  }
}
