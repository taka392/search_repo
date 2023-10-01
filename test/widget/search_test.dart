import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_repo/application/di/internet.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/presentation/pages/list_page.dart';
import 'package:search_repo/presentation/widget/search_app_bar.dart';

import '../component/http_mocks.dart';
import '../component/interfaces/internet.dart';
import '../component/test_widget.dart';

///エラが発生した際に、適切なUIが表示されるかのテスト
void main() {
  testWidgets('入力フォームのテスト', (WidgetTester tester) async {
    final mockClient = MockClient();
    final override1 = httpClientProvider.overrideWithValue(mockClient);
    final override2 = internetProvider.overrideWithValue(FakeInternetImpl());
    const int status = 200;
    const locale = Locale("ja");
    const widget = ListPage();
    final testWidget = TestWidget(
      override1: override1,
      override2: override2,
      mockClient: mockClient,
      status: status,
      locale: locale,
      widget: widget,
    );
    await testWidget.pumpWidget(tester);
    // 検索フォームを見つける
    final formField = find.byKey(SearchAppBar.textFormField);

    // 検証: 検索フォームが表示されているかどうか
    expect(formField, findsOneWidget);

    // 検証: 初期状態でヒントテキストが表示されているか
    expect(find.text("リポジトリ名を入力してください"), findsOneWidget);

    // 検証: 検索アイコンが表示されているか
    expect(find.byIcon(Icons.search), findsOneWidget);

    // 検索フォームに文字を入力
    await tester.enterText(formField, 'Rails');

    // 検証: 入力が正しく表示されているか
    expect(find.text('Rails'), findsOneWidget);

    // 描画を更新
    await tester.pump();

    // 検証: クリアアイコンをタップして文字を削除
    final clearIcon = find.byKey(SearchAppBar.clear);
    await tester.tap(clearIcon);

    // 検証: 入力が削除され、ヒントテキストが再表示されるかどうか
    expect(find.text('Rails'), findsNothing);
    expect(find.text('リポジトリ名を入力してください'), findsOneWidget);
  });
}
