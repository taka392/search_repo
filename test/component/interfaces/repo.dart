import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:search_repo/application/interfaces/repo.dart';
import 'package:search_repo/application/types/sort_enum.dart';

///リポジトリ実態の実装
class FakeRepoImpl implements Repo {
  http.Client httpClient;
  int page;
  String search;
  Sort sort;
  FakeRepoImpl({
    required this.httpClient,
    required this.page,
    required this.search,
    required this.sort,
  });

  @override
  Future getRepo() async {}

  @override
  Future addRepo() async {}

  @override
  Future searchRepo(String text) async {}

  @override
  Future refreshRepo() async {}

  @override
  Future sortRepo(Sort data) async {}
}
