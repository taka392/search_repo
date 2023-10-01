import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:search_repo/presentation/theme/fonts.dart';
import 'package:search_repo/presentation/widget/custom_text.dart';

class CustomAnimation extends ConsumerWidget {
  final String imageUrl;
  final String text;
  final String? description1;
  final String? description2;
  final Future<void> Function()? onReload;
  final bool? hasFloating;
  final String? error;
  final String? stackTrace;

  const CustomAnimation({
    super.key, // Keyの位置が間違っていました
    required this.imageUrl,
    required this.text,
    this.description1 = "",
    this.description2 = "",
    this.onReload,
    this.hasFloating = false,
    this.error = "",
    this.stackTrace = "",
  }); // Keyを適切な位置に設定

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: (description1 == "" && description2 == "")
                ? screenHeight * 0.15
                : screenHeight * 0.1,
          ),
          Lottie.asset(imageUrl),
          messages(),
          Container(height: screenHeight * 0.15),
        ],
      ),
      floatingActionButton: hasFloating == true
          ? FloatingActionButton(
              onPressed: onReload,
              child: const Icon(Icons.refresh),
            )
          : null,
    );
  }

  Column messages() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextWidget(
            text: text,
            textStyle: CustomText.titleMBold,
          ),
        ),
        CustomTextWidget(
          text: description1!,
          textStyle: CustomText.titleS,
        ),
        CustomTextWidget(
          text: description2!,
          textStyle: CustomText.titleS,
        ),
      ],
    );
  }
}
