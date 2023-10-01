import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:search_repo/application/interfaces/repo.dart';
import 'package:search_repo/application/types/sort_enum.dart';
import 'package:search_repo/domain/types/repo_model.dart';

///リポジトリ実態の実装
class RepoImpl implements Repo {
  http.Client httpClient;
  int page;
  String search;
  Sort sort;
  RepoImpl({
    required this.httpClient,
    required this.page,
    required this.search,
    required this.sort,
  });

  @override
  Future getRepo() async {
    final String sortState = change(sort);
    String sortParams = "sort=$sortState";
    if (sort == Sort.empty) {
      sortParams = "";
    }
    final apiUrl =
        'https://api.github.com/search/repositories?q=$search&$sortParams&page=$page&per_page=20';
    final response = await httpClient.get(
      Uri.parse(apiUrl),
    );
    debugPrint(apiUrl);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }

  @override
  Future addRepo() async {
    final int value = page;
    final int next = value + 1;
    final sortState = change(sort);
    String sortParams = "sort=$sortState";
    if (sort == Sort.empty) {
      sortParams = "";
    }
    final String apiUrl =
        'https://api.github.com/search/repositories?q=$search&$sortParams&page=$next&per_page=20';
    debugPrint(apiUrl);
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }

  @override
  Future searchRepo(String text) async {
    const int initPage = 1;
    final String apiUrl =
        'https://api.github.com/search/repositories?q=$text&page=$initPage&per_page=20';
    final response = await httpClient.get(
      Uri.parse(
        apiUrl,
      ),
    );
    debugPrint(apiUrl);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;
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
    const String apiUrl =
        'https://api.github.com/search/repositories?q=$initText&page=$initPage&per_page=20';
    final response = await httpClient.get(
      Uri.parse(
        apiUrl,
      ),
    );
    debugPrint(apiUrl);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }

  @override
  Future sortRepo(Sort data) async {
    final String stringSort = change(data);
    String sortParams = "sort=$stringSort";
    if (data == Sort.empty) {
      sortParams = "";
    }
    final apiUrl =
        'https://api.github.com/search/repositories?q=$search&$sortParams&page=$page&per_page=20';
    final response = await httpClient.get(
      Uri.parse(apiUrl),
    );
    debugPrint(apiUrl);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    } else {
      throw Exception('Invalid JSON response structure');
    }
  }
}
