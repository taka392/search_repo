import 'package:http/http.dart' as http;
import 'package:search_repo/application/di/repo_di.dart';
import 'dart:convert';
import 'package:search_repo/domain/types/repo_model.dart';
// データソースの実装
class AddRepo implements Repository {
  http.Client httpClient; // Providerで提供されるHttpClient
  pageNotifierProvider page;

  AddRepo(this.httpClient,this.page);

  @override
  Future<RepoModel> getRepo() async {
    final response = await httpClient.get(Uri.parse(
        'https://api.github.com/search/repositories?q=Rails&per_page=20&page=$page'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }
}


