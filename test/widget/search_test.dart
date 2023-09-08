import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:search_repo/presentation/widget/search_app_bar.dart';
import '../http_mocks.dart';
import '../mock_data.dart';

///エラが発生した際に、適切なUIが表示されるかのテスト
void main() {
  group('入力フォームのテスト', () {
    testWidgets('検索フォームの動作テスト', (WidgetTester tester) async {
      // モックデータとモッククライアントを作成
      const data = MockData.jsonMock;
      final mockClient = MockClient();

      // モッククライアントの設定
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response(data, 200));

      // アプリケーションをテストモードで起動
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            httpClientProvider.overrideWithValue(mockClient),
          ],
          child: const MaterialApp(
            home: SearchAppBar(),
            // その他の必要な設定
          ),
        ),
      );

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

  });
}

