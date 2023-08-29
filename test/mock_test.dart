import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/domain/types/item_model.dart';
import 'mock_data.dart';

void main() {
  test('JSONデータの変換テスト', () async {
    final data = json.decode(MockData.jsonMock);
    final RepoModel result = RepoModel.fromJson(data);
    expect(result.totalCount, 573491);
    expect(result.items[0].fullName, "flutter/flutter");
  });
}