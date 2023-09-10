import 'package:flutter/material.dart';
import 'package:search_repo/domain/types/item/item_model.dart';
import 'package:search_repo/presentation/theme/fonts.dart';
import 'package:search_repo/presentation/widget/custom_text.dart';

/// タブレット、パソコンで閲覧した際に表示されるWidgetです。
class Custom2GestureDetector extends StatelessWidget {
  const Custom2GestureDetector({
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: data.fullName,
                  maxLine: 1,
                  textStyle: CustomText.titleMBold,
                ),
                Expanded(child: Container()),
                const Icon(
                  Icons.star_border_sharp,
                ),
                CustomTextWidget(
                  text: data.stargazersCount.toString(),
                  maxLine: 1,
                  textStyle: CustomText.titleM,
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
                  textStyle: CustomText.titleM,
                ),
              ],
            ),
            CustomTextWidget(
              text: data.description,
              maxLine: 2,
              textStyle: CustomText.titleM,
            ),
          ],
        ),
      ),
    );
  }
}
