import 'package:search_repo/domain/types/repo_abstract.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:search_repo/domain/types/repo_model.dart';
// データソースの実装
class ApiPostDataSource implements PostRepository {

  @override
  Future<RepoModel> getPosts() async {
    final response = await http.get(Uri.parse(
        'https://api.github.com/search/repositories?q=Flutter&per_page=20'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final RepoModel aa = RepoModel.fromJson(data);
      return aa;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }
}
