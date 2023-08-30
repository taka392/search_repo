import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_repo/application/di/repo_di.dart';
import 'package:search_repo/application/state/repo.dart';
import 'package:search_repo/application/usecase/initial.dart';
import 'package:search_repo/presentation/pages/list_page.dart';

import 'initial_mock.dart';



void main() {
  group('GetRepoUseCase', () {
    testWidgets('iml total count should be 100', (WidgetTester tester) async {
      //refを取得するためにProviderContainerを取得
      final container = ProviderContainer();

      final initialMockFetch = InitialMockFetch();
      final repoIml = RepositoryImpl(initialMockFetch);
      await tester.pumpWidget(
        const ListPage(),
      );

      final notifier = container.read(repoNotifierProvider.notifier);
      final provider = container.read(repoNotifierProvider);
      debugPrint(provider.toString());
      final forgeryInitUseCase = InitAppUsecase(
        postRepositoryImpl: repoIml,
        repoProviderNotifier: notifier,
      );


      await forgeryInitUseCase.fetch();
      await tester.pump();
      await tester.pump();
      /*expect(find.text('List Page'), findsOneWidget);*/
    });
  });
}