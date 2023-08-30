import 'dart:convert';
import 'package:search_repo/domain/types/repo_abstract.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'mock_data.dart';
class InitialMockFetch implements PostRepository {
  @override
  Future<RepoModel> getPosts() async {
    final data = json.decode(MockData.jsonMock);
      final RepoModel repo = RepoModel.fromJson(data);
      return repo;
    }
  }