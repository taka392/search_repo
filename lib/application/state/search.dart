import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'search.g.dart';
@riverpod
class SearchNotifier extends _$SearchNotifier {
  @override
  String build() {
    return "stars:>0";
  }
}
