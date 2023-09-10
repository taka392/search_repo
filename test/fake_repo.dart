import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:search_repo/application/state/http_client.dart';
import 'dart:convert';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/domain/types/sort_enum.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';


final fakeRepositoryProvider = Provider<Repo>((ref) {
  final httpClient = ref.watch(httpClientProvider);
  const fakePage = 3;
  const fakeSearch = "Flutter";
  const fakeSort = Sort.forks;
  return RepoImpl(httpClient: httpClient, page: fakePage, search: fakeSearch, sort: fakeSort);
});



class FakeImpl implements Repo {
  http.Client httpClient;
  int page;
  String search;
  Sort sort;


  FakeImpl({required this.httpClient, required this.page, required this.search, required this.sort});

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
  @override
  Future addRepo() async {
    int nextPage = page + 1;
    final response = await httpClient.get(Uri.parse(
        'https://api.github.com/search/repositories?q=$search&sort=$sort&page=$nextPage&per_page=20'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }
  @override
  Future searchRepo(String text) async {
    int initPage = 1;
    final response = await httpClient.get(Uri.parse(
        'https://api.github.com/search/repositories?q=$text&page=$initPage&per_page=20'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }
  @override
  Future refreshRepo() async {
    int initPage = 1;
    String initText = "stars:>0";
    final response = await httpClient.get(Uri.parse(
        'https://api.github.com/search/repositories?q=$initText&page=$initPage&per_page=20'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }

  @override
  Future sortRepo(Sort data) async {
    final response = await httpClient.get(Uri.parse(
        'https://api.github.com/search/repositories?q=$search&sort=$data&page=$page&per_page=20'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }
}