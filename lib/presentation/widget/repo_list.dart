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
import 'package:search_repo/presentation/widget/custom_drop_down.dart';
import 'package:search_repo/presentation/widget/custom_gesture_detector.dart';
import 'package:search_repo/presentation/widget/custom_text.dart';
import 'package:search_repo/presentation/widget/search_app_bar.dart';
// ignore: must_be_immutable
class RepoList extends HookConsumerWidget {
  final RepoModel? data;
  final ScrollController controller;
  final ValueNotifier<bool> isLoading;

  RepoList({
    Key? key,
    this.data,
  }) :
        controller = ScrollController(),
        isLoading = ValueNotifier(false),
        super(key: key);

  //ListViewのにセットした controllerをテストで取得する。
  ScrollController getListScrollController() {
    return controller;
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locate = ref.watch(appLocalizationsProvider);



    void scroll() async {
      if (!isLoading.value &&
          controller.position.pixels ==
              controller.position.maxScrollExtent) {
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
        isLoading.dispose(); // ValueNotifierのdisposeを呼び出す
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
                text: "${data!.totalCount.toString()} ${locate.cases}",
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
                  return CustomGestureDetector(data: repo, onPressed: () {
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
