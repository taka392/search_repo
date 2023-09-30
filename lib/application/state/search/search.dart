// ignore_for_file: use_setters_to_change_properties

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search.g.dart';

@Riverpod(keepAlive: true)
class SearchNotifier extends _$SearchNotifier {
  @override
  String build() {
    return "stars:>0";
  }

  void update(String data) {
    state = data;
  }

  void refresh() {
    state = "stars:>0";
  }

  void save(String search) {
    state = search;
  }
}
