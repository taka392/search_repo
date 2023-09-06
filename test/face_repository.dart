import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';
import 'domain/mock_data.dart';
// Repo インターフェースの定義



class FakeRepository implements Repo {
  AsyncValue<RepoModel> fakeData;
  FakeRepository({required this.fakeData});
  @override
  Future<RepoModel> getRepo() async {
    final RepoModel repo = fakeData;
    return repo;
  }
}


