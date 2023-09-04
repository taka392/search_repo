import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'sort.g.dart';
@Riverpod(keepAlive: true)
class SortNotifier extends _$SortNotifier {
  @override
  String build() {
    return '';
  }
  void refresh() {
    state = "";
  }
  void save(String value) {
    state = value;
  }
}