// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/cupertino.dart';

class AnimationUtil {
  static Future<void> scroll(
      ScrollController? scrollController, double height) async {
    if (scrollController != null) {
      await scrollController.animateTo(
        scrollController.position.maxScrollExtent * height,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
