import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';
class LoadingRepository implements Repo {
  @override
  Future<RepoModel> getRepo() async {
    const AsyncValue<RepoModel> repo = AsyncValue<RepoModel>.loading();
    return repo;
  }
}