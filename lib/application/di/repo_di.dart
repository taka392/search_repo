// リポジトリの実装
import 'package:search_repo/domain/types/repo_model.dart';


abstract class Repository {
  Future<RepoModel> getRepo();
}

class RepositoryImpl implements Repository {
  final Repository repository;
  RepositoryImpl({
    required this.repository,
  });

  @override
  Future<RepoModel> getRepo() async {
    return await repository.getRepo();
  }
}


