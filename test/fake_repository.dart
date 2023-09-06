import 'package:search_repo/domain/types/sort_enum.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';
import 'dart:convert';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:http/http.dart' as http;
class FakeRepository implements Repo {
  http.Client? httpClient;
  int? page;
  String? search;
  Sort? sort;

  FakeRepository({this.httpClient, this.page, this.search, this.sort});

  @override
  Future getRepo() async {
      throw Exception('Invalid JSON response structure');
    }
  }