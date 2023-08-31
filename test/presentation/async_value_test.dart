import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/widget/repo_list.dart';
import 'package:http/http.dart' as http;
import '../domain/mock_data.dart';
import '../infrastructure/http_server_test.mocks.dart';

void main() {
  group('AsyncValue型のエラーハンドリングテスト', () {
    testWidgets('loadingのテスト', (WidgetTester tester) async {
      //repoModelの状態をloadingに設定
      const status = AsyncValue<RepoModel>.loading();
      await tester.pumpWidget(
        const MaterialApp( // MaterialAppでDirectionalityを提供
          home: Scaffold(
            body: RepoList(repoData: status),
          ),
        ),
      );
      expect(find.byKey(RepoList.loadingKey), findsOneWidget);
    });

    testWidgets('errorのテスト', (WidgetTester tester) async {
      //repoModelの状態をloadingに設定
      final status = AsyncValue<RepoModel>.error('エラーが発生しました', StackTrace.fromString('疑似スタックトレース'));
      await tester.pumpWidget(
        MaterialApp( // MaterialAppでDirectionalityを提供
          home: Scaffold(
            body: RepoList(repoData: status),
          ),
        ),
      );
      expect(find.byKey(RepoList.errorKey), findsOneWidget);
    });
    testWidgets('data.totalCount == 0のテスト', (WidgetTester tester) async {
      final data = json.decode(MockData.noJsonData);
      final AsyncValue<RepoModel> noMatch = AsyncValue.data(RepoModel.fromJson(data));
      await tester.pumpWidget(
        MaterialApp( // MaterialAppでDirectionalityを提供
          home: Scaffold(
            body: RepoList(repoData: noMatch),
          ),
        ),
      );
      expect(find.byKey(RepoList.noHitKey), findsOneWidget);
    });
  });
}

