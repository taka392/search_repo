// リポジトリの実装
import 'package:search_repo/domain/types/repo_model.dart';


abstract class PostRepository {
  Future<RepoModel> initRepo();
}

class RepositoryImpl {
  final PostRepository apiDataSource;
  RepositoryImpl({
    required this.apiDataSource,
  });
  Future<RepoModel> init() async {
    return await apiDataSource.initRepo();
  }
}

