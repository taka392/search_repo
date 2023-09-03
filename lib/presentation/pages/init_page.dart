import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
class InitPage extends HookConsumerWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: Container(
        child: Lottie.asset('assets/lottie/loading.json'),
      ),
    );
  }
}
