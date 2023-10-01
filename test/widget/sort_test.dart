import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_repo/application/di/internet.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/presentation/widget/custom_drop_down.dart';

import '../component/http_mocks.dart';
import '../component/interfaces/internet.dart';
import '../component/test_widget.dart';

///エラが発生した際に、適切なUIが表示されるかのテスト
void main() {
  testWidgets('ドロップダウンのテスト', (WidgetTester tester) async {
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
    const widget = Scaffold(body: CustomDropdown());
    final testWidget = TestWidget(
      override1: override1,
      override2: override2,
      override3: override3,
      status: status,
      locale: locale,
      widget: widget,
    );
    await testWidget.pumpWidget(tester);
    final dropDown = find.byKey(CustomDropdown.dropDown);
    await tester.pump();
    // 検証: ドロップダウンが表示されているかどうか
    expect(dropDown, findsOneWidget);

    //初期値がベストマッチになっているか。
    expect(
      find.descendant(
        of: find.byKey(CustomDropdown.dropDown),
        matching: find.text("ベストマッチ"),
      ),
      findsOneWidget,
    );

    // ドロップダウンをタップ
    await tester.tap(dropDown);
    await tester.pump();
    // ドロップダウンメニューが表示されているかどうかを検証
    expect(find.byKey(CustomDropdown.stars), findsOneWidget);
    expect(find.byKey(CustomDropdown.forks), findsOneWidget);
    expect(find.byKey(CustomDropdown.help), findsOneWidget);
    expect(find.byKey(CustomDropdown.update), findsOneWidget);
  });
}
