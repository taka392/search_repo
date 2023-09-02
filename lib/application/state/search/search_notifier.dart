import 'package:hooks_riverpod/hooks_riverpod.dart';
class SearchNotifier extends StateNotifier<String> {
  SearchNotifier(
      /// 初期値
      String initialSearch,
      ) : super(initialSearch);

}