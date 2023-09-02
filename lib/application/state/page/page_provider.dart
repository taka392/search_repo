import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/application/state/page/page_notifier.dart';

final pageProvider = StateNotifierProvider.autoDispose<PageNotifier,int>((ref) {
  return PageNotifier(1);
});
