import 'package:http/http.dart' as http;
import 'package:search_repo/application/di/repo_di.dart';
import 'dart:convert';
import 'package:search_repo/domain/types/repo_model.dart';
// データソースの実装
class InitialFetch implements Repository {
  http.Client httpClient; // Providerで提供されるHttpClient

  InitialFetch(this.httpClient);

  @override
  Future<RepoModel> initRepo() async {
    final response = await httpClient.get(Uri.parse(
        'https://api.github.com/search/repositories?q=Flutter&per_page=20'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }
  @override
  Future<RepoModel> addRepo() async {
    final response = await httpClient.get(Uri.parse(
        'https://api.github.com/search/repositories?q=Flutter&per_page=20'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }

}
