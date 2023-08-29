import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/application/di/use_usecase.dart';

void main() {
  runApp(const ProviderScope(child: MyWidget4()));
}

class MyWidget4 extends ConsumerWidget {
  const MyWidget4({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // S4 watch
    final s4 = ref.watch(initAppProvider).execute();

    // 縦に並べる
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // 横に並べる
        Text(s4.toString()),
      ],
    );
  }
}