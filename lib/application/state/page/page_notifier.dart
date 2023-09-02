import 'package:hooks_riverpod/hooks_riverpod.dart';
class PageNotifier extends StateNotifier<int> {
  PageNotifier(
      /// 初期値
      int initialPage,
      ) : super(initialPage);

  void update() {
    state = state + 1;
  }
}