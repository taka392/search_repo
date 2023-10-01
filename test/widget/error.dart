import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_repo/application/di/internet.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/pages/list_page.dart';

import '../component/http_mocks.dart';
import '../component/interfaces/internet.dart';
import '../component/test_widget.dart';

///エラが発生した際に、適切なUIが表示されるかのテスト
void main() {
  group('Error,Loading,Emptyのテスト', () {
    testWidgets('Errorのテスト', (WidgetTester tester) async {
      final mockClient = MockClient();
      final override1 = httpClientProvider.overrideWithValue(mockClient);
      final override2 = internetProvider.overrideWithValue(FakeInternetImpl());
      final override3 = asyncValueProvider.overrideWithValue(
        AsyncValue.error(
          "エラーメッセージ",
          StackTrace.fromString('Fake stack trace'),
        ),
      );
      const int status = 404;
      const locale = Locale("ja");
      const widget = ListPage();
      final testWidget = TestWidget(
        override1: override1,
        override2: override2,
        override3: override3,
        status: status,
        locale: locale,
        widget: widget,
      );
      await testWidget.pumpWidget(tester);
      await tester.pump();
      await tester.pump();
      expect(find.byKey(ListPage.errorKey), findsOneWidget);
    });

    testWidgets('Loadingのテスト', (WidgetTester tester) async {
      final mockClient = MockClient();
      final override1 = httpClientProvider.overrideWithValue(mockClient);
      final override2 = internetProvider.overrideWithValue(FakeInternetImpl());
      final override3 =
          asyncValueProvider.overrideWithValue(const AsyncValue.loading());
      const int status = 200;
      const locale = Locale("ja");
      const widget = ListPage();
      final testWidget = TestWidget(
        override1: override1,
        override2: override2,
        override3: override3,
        status: status,
        locale: locale,
        widget: widget,
      );
      await testWidget.pumpWidget(tester);
      await tester.pump();
      await tester.pump();
      expect(find.byKey(ListPage.loadingKey), findsOneWidget);
    });

    testWidgets('Emptyのテスト', (WidgetTester tester) async {
      final mockClient = MockClient();
      final override1 = httpClientProvider.overrideWithValue(mockClient);
      final override2 = internetProvider.overrideWithValue(FakeInternetImpl());
      final override3 = asyncValueProvider.overrideWithValue(
        const AsyncData(
          RepoModel(
            items: [],
            totalCount: 0,
          ),
        ),
      );
      const int status = 200;
      const locale = Locale("ja");
      const widget = ListPage();
      final testWidget = TestWidget(
        override1: override1,
        override2: override2,
        override3: override3,
        status: status,
        locale: locale,
        widget: widget,
      );
      await testWidget.pumpWidget(tester);
      await tester.pump();
      await tester.pump();
      expect(find.byKey(ListPage.noHitKey), findsOneWidget);
    });
  });
}
