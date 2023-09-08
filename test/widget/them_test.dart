import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/application/state/them_model.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/pages/list_page.dart';
import 'package:search_repo/presentation/theme/color.dart';
import 'package:search_repo/presentation/theme/them_data/dark_them.dart';
import 'package:http/http.dart' as http;
import 'package:search_repo/presentation/widget/search_app_bar.dart';
import '../http_mocks.dart';
import '../mock_data.dart';
/// Usecaseのテスト
void main() {
  testWidgets('テーマのテスト', (WidgetTester tester) async {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // テスト後にドライバーを閉じる
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    // ダークモード状態をセット。
    const fakeThemeMode = ThemeMode.dark;

    // ダークモードのテーマデータを作成
    final darkThemeData = ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: CustomColor.black2, // AppBarの背景色を設定
        // 他のプロパティも設定...
      ),
    );

    // RepoListに与える初期値をセット。
    final client = MockClient();
    const data = MockData.jsonMock;
    final RepoModel result = RepoModel.fromJson(json.decode(data));
    when(client.get(any)).thenAnswer((_) async => http.Response('', 404));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          httpClientProvider.overrideWithValue(client),
          themeModeProvider.overrideWithValue(fakeThemeMode),
          themeDataProvider.overrideWithValue(darkThemeData), // テーマデータを提供
        ],
        child: const MaterialApp(
          home: ListPage(), // テスト対象のWidget
        ),
      ),
    );

    final screenshot = await driver.screenshot();

    // スクリーンショットのピクセル色を解析
    final pixelColor = await driver.getPixelColor(const Point(100, 100)); // 任意の座標を指定

    expect(pixelColor, equals(const Color(0xFF000000)));
  });
}
//flutter drive --target=test/widget/them_test.dart