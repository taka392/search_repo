import 'package:flutter/material.dart';
import 'package:search_repo/domain/types/item_model.dart';
import 'package:search_repo/presentation/widget/custom_text.dart';

class CustomGestureDetector extends StatelessWidget {

  const CustomGestureDetector({
    super.key,
    required this.data,
  });
  final ItemModel data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 40.0, // サークルアバターの大きさを調整するための半径の値
          backgroundImage: NetworkImage(data.owner.avatarUrl),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: data.fullName,
              maxLine: 1,
              textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 3,
            ),
            CustomTextWidget(
              text: data.description,
              maxLine: 2,
              textStyle: const TextStyle(fontSize: 12.0),
            ),
            Container(
              height: 3,
            ),
          ],
        ),
        subtitle: Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.grey,
              size: 20.0,
            ),
            CustomTextWidget(
              text: data.stargazersCount.toString(),
              maxLine: 1,
              textStyle: const TextStyle(fontSize: 15.0),
            ),
            Container(
              width: 3,
            ),
            const Icon(
              Icons.fork_right,
              color: Colors.grey,
              size: 20.0,
            ),
            CustomTextWidget(
              text: data.forksCount.toString(),
              maxLine: 1,
              textStyle: const TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}