// リポジトリの実装
import 'package:search_repo/domain/types/repo_model.dart';


abstract class Repository {
  Future<RepoModel> initRepo();
  Future<RepoModel> addRepo();
}

class RepositoryImpl {
  final Repository repository;
  RepositoryImpl({
    required this.repository,
  });
  Future<RepoModel> init() async {
    return await repository.initRepo();
  }
  Future<RepoModel> add() async {
    return await repository.addRepo();
  }
}

