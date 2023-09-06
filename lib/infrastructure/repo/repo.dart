import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/domain/types/sort_enum.dart';
// データソースの実装
abstract class Repo {
  Future getRepo();
}
class RepoImpl implements Repo {
  http.Client httpClient;
  int page;
  String search;
  Sort sort;

  RepoImpl({required this.httpClient, required this.page, required this.search, required this.sort});

  @override
  Future getRepo() async {
    final response = await httpClient.get(Uri.parse(
        'https://api.github.com/search/repositories?q=$search&sort=$sort&page=$page&per_page=20'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }
}



