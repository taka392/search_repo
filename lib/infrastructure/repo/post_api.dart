import 'package:search_repo/domain/types/repo_abstract.dart';
// データソースの実装
class ApiPostDataSource implements PostRepository {
  final http.Client httpClient;

  ApiPostDataSource(this.httpClient);

  @override
  Future<List<PostEntity>> getPosts() async {
    // データをAPIから取得し、エンティティのリストに変換する処理
  }
}
