import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:search_repo/presentation/theme/fonts.dart';
import 'package:search_repo/presentation/widget/custom_text.dart';

class CustomAnimation extends ConsumerWidget {
  final String imageUrl;
  final String text;
  final String? description;
  final Future<void> Function()? onRefresh;

  const CustomAnimation({
    super.key,
    required this.imageUrl,
    required this.text,
    this.description,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      color: Colors.grey,
      onRefresh: onRefresh!,
      child: ListView(
        children: [
          const SizedBox(height: 80),
          Lottie.asset(imageUrl), // Load a Lottie file from the provided URL
          Text(
            text,
            textAlign: TextAlign.center,
          ),
          Center(
            child: CustomTextWidget(
              text: "dddd",
              textStyle: CustomText.titleMBold,
              maxLine: 1,
            ),
          ),
        ],
      ),
    );
  }
}
