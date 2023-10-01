import 'package:flutter_riverpod/flutter_riverpod.dart';

//ローディングフラグ
final isLoadingProvider = StateProvider<bool>((ref) => false);
