import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/application/types/screen_size.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/pages/list_page.dart';
import 'package:search_repo/presentation/widget/repo_list.dart';

import '../http_mocks.dart';
import '../mock_data.dart';

///ListPageで実装したレスポンシブデザインが適切に動作するかのテスト
void main() {
  testWidgets('フレックステスト', (WidgetTester tester) async {
    const data = MockData.jsonMock;
    final mockClient = MockClient();
    // 空文字を送信するとリクエストはせず、エラーメッセージを表示する
    when(mockClient.get(any)).thenAnswer((_) async => http.Response(data, 200));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          httpClientProvider.overrideWithValue(mockClient),
          watchRepoProvider.overrideWithValue(
            const AsyncData(
              RepoModel(
                items: [],
                totalCount: 0,
              ),
            ),
          ),
        ],
        child: const MaterialApp(
          home: ListPage(),
          // Other necessary configurations
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    ///スマホの場合とタブレット、デスクトップの場合で指定のWidgetが表示されているかの検証
    // ignore: unrelated_type_equality_checks
    if (ScreenSizeClass.phone == 320) {
      await tester.pump();
      expect(find.byKey(RepoList.iphoneKey), findsOneWidget);
      // ignore: unrelated_type_equality_checks
    } else if (ScreenSizeClass.tablet == 600 ||
        // ignore: unrelated_type_equality_checks
        ScreenSizeClass.desktop == 1000) {
      await tester.pump();
      expect(find.byKey(RepoList.elseKey), findsOneWidget);
    }
  });
}
