import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:search_repo/application/types/sort_enum.dart';
import 'package:search_repo/domain/interface.dart';
import 'package:search_repo/domain/types/repo/repo_model.dart';

///リポジトリ実態の実装
class RepoImpl implements Repo {
  http.Client httpClient;
  int page;
  String search;
  Sort sort;
  RepoImpl({required this.httpClient, required this.page, required this.search, required this.sort});

  @override
  Future getRepo() async {
    final String sortValue = (sort == Sort.empty) ? "" : sort.toString(); // Sort.emptyの場合、空文字列にする
    final response = await httpClient.get(Uri.parse(
        'https://api.github.com/search/repositories?q=$search&sort=$sortValue&page=$page&per_page=20',),);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }
  @override
  Future addRepo() async {
    final int nextPage = page + 1;
    final String sortValue = (sort == Sort.empty) ? "" : sort.toString(); // Sort.emptyの場合、空文字列にする
    final response = await httpClient.get(Uri.parse(
        'https://api.github.com/search/repositories?q=$search&sort=$sortValue&page=$nextPage&per_page=20',),);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }
  @override
  Future searchRepo(String text) async {
    const int initPage = 1;
    final response = await httpClient.get(Uri.parse(
        'https://api.github.com/search/repositories?q=$text&page=$initPage&per_page=20',),);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }
  @override
  Future refreshRepo() async {
    const int initPage = 1;
    const String initText = "stars:>0";
    final response = await httpClient.get(Uri.parse(
        'https://api.github.com/search/repositories?q=$initText&page=$initPage&per_page=20',),);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }
  @override
  Future sortRepo(Sort data) async {
    final response = await httpClient.get(Uri.parse(
        'https://api.github.com/search/repositories?q=$search&sort=$data&page=$page&per_page=20',),);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }
}
