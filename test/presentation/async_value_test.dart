import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_repo/application/state/l10n/applocalizatons_provider.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/pages/list_page.dart';

import '../domain/mock_data.dart';
void main() {

  group('AsyncValue型のエラーハンドリングテスト', () {
    testWidgets('loadingのテスト', (WidgetTester tester) async {
      //repoModelの状態をloadingに設定
      const repoData = AsyncValue<RepoModel>.loading();
      ScrollController scrollController = ScrollController();
      final container = ProviderContainer();
      final locate = container.read(appLocalizationsProvider);


      await tester.pumpWidget(
        MaterialApp( // MaterialAppでDirectionalityを提供
          home: ProviderScope(
            overrides: const [],
            child: ListPage(repoData: repoData, scrollController: scrollController, locate: locate),
          ),
        ),
      );
      await tester.pump();
      expect(find.byKey(ListPage.loadingKey), findsOneWidget);
    });

    testWidgets('errorのテスト', (WidgetTester tester) async {
      //repoModelの状態をloadingに設定
      final repoData = AsyncValue<RepoModel>.error('エラーが発生しました', StackTrace.fromString('疑似スタックトレース'));
      final scrollController = ScrollController();
      final container = ProviderContainer();
      final locate = container.read(appLocalizationsProvider);
      await tester.pumpWidget(
        MaterialApp( // MaterialAppでDirectionalityを提供
          home: ProviderScope(
            overrides: const [],
            child: ListPage(repoData: repoData, scrollController: scrollController, locate: locate),
          ),
        ),
      );
      await tester.pump();
      expect(find.byKey(ListPage.errorKey), findsOneWidget);
    });
    testWidgets('data.totalCount == 0のテスト', (WidgetTester tester) async {
      final data = json.decode(MockData.noJsonData);
      final AsyncValue<RepoModel> repoData = AsyncValue.data(RepoModel.fromJson(data));
      final scrollController = ScrollController();
      final container = ProviderContainer();
      final locate = container.read(appLocalizationsProvider);
      await tester.pumpWidget(
        MaterialApp( // MaterialAppでDirectionalityを提供
          home: ProviderScope(
            overrides: const [],
            child: ListPage(repoData: repoData, scrollController: scrollController, locate: locate),
          ),
        ),
      );
      await tester.pump();
      expect(find.byKey(ListPage.noHitKey), findsOneWidget);
    });
  });
}

