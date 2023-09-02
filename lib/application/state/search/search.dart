import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'search.g.dart';
@Riverpod(keepAlive: true)
class SearchNotifier extends _$SearchNotifier {
  @override
  String build() {
    return "stars:>0";
  }
}
