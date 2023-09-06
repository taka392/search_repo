import 'dart:convert';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';
class FakeRepository implements Repo {
  String fakeData;
  FakeRepository({required this.fakeData});
  @override
  Future<RepoModel> getRepo() async {
    final Map<String, dynamic> data = json.decode(fakeData);
    await Future.delayed(const Duration(seconds: 2));
    final RepoModel repo = RepoModel.fromJson(data);
    return repo;
  }
}


