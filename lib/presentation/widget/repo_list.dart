import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/domain/types/item_model.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/widget/custom_animation.dart';
import 'package:search_repo/presentation/widget/custom_gesture_detector.dart';
import 'package:search_repo/presentation/widget/custom_text.dart';

class RepoList extends HookConsumerWidget {
  final AsyncValue<RepoModel> repoData;
  final VoidCallback onPressed;

  const RepoList({Key? key, required this.repoData, required this.onPressed}) : super(key: key);

  @visibleForTesting
  static final loadingKey = UniqueKey();
  @visibleForTesting
  static final errorKey = UniqueKey();
  @visibleForTesting
  static final noHitKey = UniqueKey();


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final scrollController = useScrollController();
    bool isLoading = false;
    void scroll(){
      if (!isLoading && scrollController.position.pixels >= scrollController.position.maxScrollExtent * 0.95) {
        isLoading = true;
        final usecase = ref.read(addAppProvider);
        usecase.add();
        final page = ref.watch(pageProvider);
        debugPrint(page.toString());
        scrollController.animateTo(
          scrollController.position.maxScrollExtent * 0.94,
          duration: const Duration(milliseconds: 500), // アニメーションの時間
          curve: Curves.easeInOut, // アニメーションのカーブ
        );
        isLoading = false;
      }
    }

    useEffect(() {
      scrollController.addListener(scroll);
      return (){
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomTextWidget(
                  text: "${data.totalCount.toString()}件",
                  maxLine: 1,
                  textStyle: const TextStyle(fontSize: 16.0),
                ),
              ),
              Expanded(child: Container()),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          Container(
            height: 0.5,
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              shrinkWrap: true,
              itemCount: data.items.length+1,
              separatorBuilder: (BuildContext context, int index) => const Divider(
                height: 0.5,
              ),
              itemBuilder: (BuildContext context, index) {
                if (index < data.items.length) {
                  ItemModel repo = data.items[index];
                  return CustomGestureDetector(data: repo,onPressed: (){});
                }else{
                  return const Center(
                      child: CupertinoActivityIndicator(
                        radius: 20.0,
                        color: CupertinoColors.inactiveGray,
                      )
                  );
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
            onRefresh: ()async{},
            key: loadingKey),
        error: (e, s) => CustomAnimation(
            imageUrl: 'assets/lottie/error.json',
            text: 'エラー $e',
            onRefresh: () async{},
            key: errorKey),
        data: (data) {
          if (data.totalCount == 0) {
            return CustomAnimation(
                imageUrl: 'assets/lottie/not_found.json',
                text: 'ヒットがありません',
                onRefresh: () async{},
                key: noHitKey);
          } else {
            return listView(data);
          }
        });
    return repoList;
  }
}
