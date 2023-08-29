import 'package:flutter/material.dart';
import 'package:search_repo/application/di/post_repo_imt.dart';
import 'package:search_repo/domain/types/repo_abstract.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/post_api.dart';

// プレゼンテーション層の実装
class PostListScreen extends StatelessWidget {
  final RepoModel postRepository;

  const PostListScreen(this.postRepository, {super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: Text(postRepository.toString()),
    );
  }
}

void main() async {
  PostRepository postRepository = PostRepositoryImpl(ApiPostDataSource());

  // You need to use await to wait for the Future<RepoModel> to complete
  RepoModel repoModel = await postRepository.getPosts();

  runApp(MaterialApp(home: PostListScreen(repoModel)));
}

