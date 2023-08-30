// リポジトリの実装
import 'package:search_repo/domain/types/repo_abstract.dart';
import 'package:search_repo/domain/types/repo_model.dart';

class RepositoryImpl implements PostRepository {
  PostRepository? apiDataSource;

  RepositoryImpl(this.apiDataSource);

  @override
  Future<RepoModel> getPosts() async {
    return await apiDataSource!.getPosts();
  }
}

