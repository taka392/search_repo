import 'package:search_repo/domain/types/repo_model.dart';
// リポジトリのインターフェース
abstract class PostRepository {
  Future<List<RepoModel>> getPosts();
}
