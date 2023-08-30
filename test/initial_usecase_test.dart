import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/di/repo_di.dart';
import 'package:search_repo/application/state/repo.dart';
import 'package:search_repo/application/usecase/initial.dart';
import 'package:search_repo/domain/types/repo_abstract.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/pages/list_page.dart';

import 'initial_mock.dart';
import 'mock_data.dart';


class MockYourRepository extends Mock implements PostRepository {}
void main() {
  group('GetRepoUseCase', () {
    testWidgets('listが表示されるかテストします。', (WidgetTester tester) async {

      final mockRepository = MockYourRepository();
      const data = MockData.jsonMock;
      final repo = RepoModel.fromJson(data as Map<String, dynamic>);

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
