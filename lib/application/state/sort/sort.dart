import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repo/domain/types/sort_enum.dart';
part 'sort.g.dart';
@Riverpod(keepAlive: true)
class SortNotifier extends _$SortNotifier {
  @override
  Sort build() {
    return Sort.stars;
  }
  void refresh() {
    state = Sort.stars;
  }
  void save(Sort value) {
    state = value;
  }
}