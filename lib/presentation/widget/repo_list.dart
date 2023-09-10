import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/l10n/applocalizatons_provider.dart';
import 'package:search_repo/domain/types/item_model.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/theme/color.dart';
import 'package:search_repo/presentation/theme/fonts.dart';
import 'package:search_repo/presentation/theme/screen_pod.dart';
import 'package:search_repo/presentation/widget/custom2_gesture_detector.dart';
import 'package:search_repo/presentation/widget/custom_drop_down.dart';
import 'package:search_repo/presentation/widget/custom_gesture_detector.dart';
import 'package:search_repo/presentation/widget/custom_text.dart';
import 'package:search_repo/presentation/widget/search_app_bar.dart';
class RepoList extends HookConsumerWidget {
  final RepoModel? data;


  const RepoList({
    Key? key,
    this.data,
  }) :super(key: key);

  @visibleForTesting
  static final totalCountKey = UniqueKey();



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final locate = ref.watch(appLocalizationsProvider);
    final controller = useScrollController();

    final screen = ScreenRef(context).watch(screenProvider);

    void scroll() async {
      if (!isLoading.value &&
          controller.position.pixels == controller.position.maxScrollExtent) {
        isLoading.value = true;
        final usecase = ref.read(addAppProvider(controller));
        await usecase.add();
        isLoading.value = false;
      }
    }

    useEffect(() {
      controller.addListener(scroll);
      return () {
        controller.removeListener(scroll);
        controller.dispose();
        isLoading.dispose();
      };
    }, []);

    return Scaffold(
      appBar: SearchAppBar(
        scrollController: controller,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              CustomTextWidget(
                text: "${data?.totalCount.toString() ?? '0'} ${locate.cases}",
                maxLine: 1,
                textStyle: CustomText.titleM,
              ),
              const Spacer(),
              CustomDropdown(
                scrollController: controller,
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
              controller: controller,
              itemCount: data!.items.length + 1,
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(
                height: 15,
              ),
              itemBuilder: (BuildContext context, index) {
                if (index < data!.items.length) {
                  ItemModel repo = data!.items[index];
                  // 条件に基づいてCustomGestureDetectorを使い分ける
                  return screen.sizeClass == ScreenSizeClass.phone
                      ? CustomGestureDetector(data: repo, onPressed: () {
                    final usecase = ref.read(detailProvider(repo));
                    usecase.detail();
                  })
                      : Custom2GestureDetector(data: repo, onPressed: () {
                    final usecase = ref.read(detailProvider(repo));
                    usecase.detail();
                  });
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
