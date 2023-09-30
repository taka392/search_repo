import 'package:flutter/material.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/theme/fonts.dart';
import 'package:search_repo/presentation/widget/custom_text.dart';

///スマホで閲覧した際に表示されるWidgetです。
class CustomGestureDetector extends StatelessWidget {
  const CustomGestureDetector({
    super.key,
    required this.data,
    required this.onPressed,
  });

  final ItemModel data;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        leading: CircleAvatar(
          radius: 40.0,
          backgroundImage: NetworkImage(data.owner.avatarUrl),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextWidget(
              text: data.fullName,
              maxLine: 1,
              textStyle: CustomText.titleMBold,
            ),
            Container(
              height: 3,
            ),
            CustomTextWidget(
              text: data.description,
              maxLine: 2,
              textStyle: CustomText.titleS,
              textAlign: TextAlign.start,
            ),
            Container(
              height: 3,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star_border_sharp,
                ),
                CustomTextWidget(
                  text: data.stargazersCount.toString(),
                  maxLine: 1,
                  textStyle: CustomText.titleS,
                ),
                Container(
                  width: 3,
                ),
                const Icon(
                  Icons.fork_right,
                ),
                CustomTextWidget(
                  text: data.forksCount.toString(),
                  maxLine: 1,
                  textStyle: CustomText.titleS,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
