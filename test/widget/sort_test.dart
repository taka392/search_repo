import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/presentation/widget/custom_drop_down.dart';

import '../http_mocks.dart';
import '../mock_data.dart';

///エラが発生した際に、適切なUIが表示されるかのテスト
void main() {
  testWidgets('ドロップダウンのUIテスト', (WidgetTester tester) async {
    // モックデータとモッククライアントを作成

    const data = MockData.jsonMock;
    final mockClient = MockClient();

    // モッククライアントの設定
    when(mockClient.get(any)).thenAnswer((_) async => http.Response(data, 200));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          httpClientProvider.overrideWithValue(mockClient),
        ],
        child: const Material(
          child: MaterialApp(home: CustomDropdown()),
        ),
      ),
    );

    // ドロップダウンを見つける
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
