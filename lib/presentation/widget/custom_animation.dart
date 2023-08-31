import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lottie/lottie.dart';
class CustomAnimation extends ConsumerWidget {
  final String imageUrl;
  final String text;

  const CustomAnimation({Key? key, required this.imageUrl, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      color: Colors.grey,
      onRefresh: () async {},
      child: ListView(
        children: [
          const SizedBox(height: 80),
          Lottie.asset(imageUrl), // Load a Lottie file from the provided URL
          Text(text,textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}

