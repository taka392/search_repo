import 'package:search_repo/domain/types/repo_model.dart';
abstract class Repository {
  Future<RepoModel> getRepo();
}
