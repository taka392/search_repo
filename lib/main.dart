//flutter pub run import_sorter:main　コマンドで整形↓
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/infrastructure/repo/http_cliant.dart';
import 'package:search_repo/infrastructure/repo/post_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Text(PostRepositoryImpl(ApiPostDataSource(ref.watch(httpClientProvider)).getPosts()))
    );
  }
}

}
