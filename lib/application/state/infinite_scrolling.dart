//無限スクロール用のProviderです。
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/application/di/usecases.dart';
import 'package:search_repo/application/state/loading.dart';
import 'package:search_repo/application/state/scroll_controller.dart';

//ListView用のProvider
final infiniteScrollProvider = Provider<ScrollController>((ref) {
  final controller = ref.watch(scrollProvider);
  final isLoading = ref.watch(isLoadingProvider.notifier);

  controller.addListener(() async {
    if (!isLoading.state &&
        controller.position.pixels == controller.position.maxScrollExtent) {
      isLoading.state = true;
      final usecase = ref.read(addProvider(controller));
      await usecase.add();
      isLoading.state = false;
    }
  });
  ref.onDispose(() {
    controller.dispose(); // コントローラーを解放
  });
  return controller;
});
