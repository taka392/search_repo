import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:search_repo/domain/types/repo_model.dart';

import '../../fake/mock_data.dart';

void main() {
  test('fromJsonの変換テスト', () async {
    final Map<String, dynamic> data =
        json.decode(MockData.jsonMock) as Map<String, dynamic>;
    final RepoModel result = RepoModel.fromJson(data);
    expect(result.totalCount, 573491);
    expect(result.items[0].fullName, "flutter/flutter");
    expect(
      result.items[0].owner.avatarUrl,
      "https://avatars.githubusercontent.com/u/14101776?v=4",
    );
  });
}
