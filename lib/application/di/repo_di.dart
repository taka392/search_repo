// リポジトリの実装
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/post_api.dart';

class RepositoryImpl {
  InitialFetch? apiDataSource;

  RepositoryImpl(this.apiDataSource);

  Future<RepoModel> getPosts() async {
    return await apiDataSource!.getPosts();
  }
}

