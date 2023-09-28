import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/presentation/theme/color.dart';
import 'package:search_repo/presentation/theme/fonts.dart';
import 'package:search_repo/presentation/widget/custom_element.dart';
import 'package:search_repo/presentation/widget/custom_text.dart';

class ShowPage extends ConsumerWidget {
  const ShowPage({
    super.key,
    required this.data,
  });
  //dataにはItemRepoのidが代入されている。
  final String data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //リポジトリを取得
    final repo = ref.watch(repoStateProvider);
    // ignore: unrelated_type_equality_checks
    final showRepo = repo?.items.firstWhere(
      (item) => item.id.toString() == data,
    );
    return Scaffold(
      appBar: AppBar(
        // 戻るボタンを作成
        leading: IconButton(
          iconSize: 30,
          icon: const Icon(
            Icons.backspace_outlined,
            color: CustomColor.gray1,
          ), // 戻るアイコン///////////ここはまじで謎！！意味不明
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(showRepo!.owner.avatarUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextWidget(
                text: showRepo.fullName,
                textStyle: CustomText.titleMBold,
                maxLine: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  showRepo.description,
                  textAlign: TextAlign.center, // テキストの中央揃え
                ),
              ),
            ),
            CustomElement(
              text: showRepo.language,
              textStyle: CustomText.titleMBold,
              icon: const Icon(Icons.language),
              color: Colors.white,
              title: "言語",
            ),
            CustomElement(
              text: showRepo.stargazersCount.toString(),
              textStyle: CustomText.titleMBold,
              icon: const Icon(Icons.star),
              color: Colors.white,
              title: "スター",
            ),
            CustomElement(
              text: showRepo.watchersCount.toString(),
              textStyle: CustomText.titleMBold,
              icon: const Icon(Icons.remove_red_eye_rounded),
              color: Colors.white,
              title: "ウォッチ",
            ),
            CustomElement(
              text: showRepo.forksCount.toString(),
              textStyle: CustomText.titleMBold,
              icon: const Icon(Icons.fork_left),
              color: Colors.white,
              title: "フォーク",
            ),
            CustomElement(
              text: showRepo.openIssuesCount.toString(),
              textStyle: CustomText.titleMBold,
              icon: const Icon(Icons.help),
              color: Colors.white,
              title: "イシュー",
            ),
          ],
        ),
      ),
    );
  }
}
