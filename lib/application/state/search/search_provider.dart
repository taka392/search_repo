import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/application/state/search/search_notifier.dart';


final searchProvider = StateNotifierProvider.autoDispose<SearchNotifier,String>((ref) {
  return SearchNotifier('stars:>0');
});