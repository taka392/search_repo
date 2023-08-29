import 'package:flutter/material.dart';
import 'package:search_repo/application/di/post_repo_imt.dart';
import 'package:search_repo/domain/types/repo_abstract.dart';
import 'package:search_repo/infrastructure/repo/post_api.dart';
import 'package:http/http.dart' as http;

// プレゼンテーション層の実装
class PostListScreen extends StatelessWidget {
  final PostRepository postRepository;

  const PostListScreen(this.postRepository, {super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: Text(postRepository.toString()),
    );
  }
}

void main() {
  final postRepository = PostRepositoryImpl(ApiPostDataSource(http.Client()).getPosts() as ApiPostDataSource);
  runApp(MaterialApp(home: PostListScreen(postRepository)));
}
