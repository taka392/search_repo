import 'package:hooks_riverpod/hooks_riverpod.dart';
class SortNotifier extends StateNotifier<String> {
  SortNotifier(
      /// 初期値
      String initialSort,
      ) : super(initialSort);

}