import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/application/state/sort/sort_notifier.dart';


final sortProvider = StateNotifierProvider.autoDispose<SortNotifier,String>((ref) {
  return SortNotifier('');
});