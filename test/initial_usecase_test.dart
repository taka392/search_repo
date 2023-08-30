import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_repo/application/di/repo_di.dart';
import 'package:search_repo/application/state/repo.dart';
import 'package:search_repo/application/usecase/initial.dart';
import 'package:search_repo/presentation/pages/list_page.dart';

import 'initial_mock.dart';



void main() {
  group('GetRepoUseCase', () {
    testWidgets('listが表示されるかテストします。', (WidgetTester tester) async {
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
