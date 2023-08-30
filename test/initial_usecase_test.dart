


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';

import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/pages/list_page.dart';
import 'mock_data.dart';


class MockClient extends Mock implements http.Client {}
void main() {
  group('GetRepoUseCase', () {
    testWidgets('listが表示されるかテストします。', (WidgetTester tester) async {

      final client = MockClient();
      http.Response response = http.Response(MockData.jsonMock, 200);

      when(client.get(any)).thenAnswer((_) async => response);
      final repo = RepoModel.fromJson(data);

      // モックのデータを定義
      when(mockRepository.getPosts()).thenAnswer((_) async {
        return repo;
      });

      await tester.pumpWidget(
        const MaterialApp( // または WidgetsApp
          home: ProviderScope(
            child: ListPage(),
          ),
        ),
      );
      expect(find.text('List Page'), findsOneWidget);
    });
  });
}
