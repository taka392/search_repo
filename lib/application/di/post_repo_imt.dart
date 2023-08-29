// リポジトリの実装
import 'package:search_repo/domain/types/repo_abstract.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/post_api.dart';

class PostRepositoryImpl implements PostRepository {
  final ApiPostDataSource apiDataSource;

  PostRepositoryImpl(this.apiDataSource);

  @override
  Future<RepoModel> getPosts() async {
    return await apiDataSource.getPosts();
  }
}

