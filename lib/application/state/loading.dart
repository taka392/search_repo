import 'package:flutter_riverpod/flutter_riverpod.dart';


//ローディングフラグ
final isLoadingProvider =
StateProvider.autoDispose<bool>((ref) => false);
