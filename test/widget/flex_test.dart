// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_repo/application/di/internet.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/application/types/screen_size.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/pages/list_page.dart';
import 'package:search_repo/presentation/widget/repo_list.dart';

import '../component/http_mocks.dart';
import '../component/interfaces/internet.dart';
import '../component/test_widget.dart';

///ListPageで実装したレスポンシブデザインが適切に動作するかのテスト
void main() {
  testWidgets('レスポンシブのテスト', (WidgetTester tester) async {
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
    if (ScreenSizeClass.phone == 320) {
      await tester.pump();
      expect(find.byKey(RepoList.iphoneKey), findsOneWidget);
    } else if (ScreenSizeClass.tablet == 600 ||
        ScreenSizeClass.desktop == 1000) {
      await tester.pump();
      expect(find.byKey(RepoList.elseKey), findsOneWidget);
    }
  });
}
