// リポジトリの実装
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/post_api.dart';


/*abstract class PostRepository {
  Future<void> init();
  Future<void> add(Post post);
  Future<List<Post>> fetch();
}*/

class RepositoryImpl {
  final InitialFetch apiDataSource;
  RepositoryImpl({
    required this.apiDataSource,
  });
  Future<RepoModel> init() async {
    return await apiDataSource.initRepo();
  }
}

