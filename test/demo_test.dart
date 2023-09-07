import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';
import 'package:search_repo/domain/types/repo_model.dart';

void main() {
  testWidgets('Error widget is displayed when an error occurs', (WidgetTester tester) async {
    // エラー状態をセットアップ
    final errorProvider = Provider<AsyncValue<RepoModel>>((ref) {
      return AsyncValue<RepoModel>.error('An error occurred','error' as StackTrace); // エラーメッセージを指定
    });

    // テスト用のProviderContainerを作成し、repoProviderをerrorProviderにオーバーライド
    final container = ProviderContainer(overrides: [repoProvider.overrideWithValue(errorProvider)]);

    // テスト対象のウィジェットを作成し、テスト実行
    await tester.pumpWidget(
      ProviderScope(
        container: container,
        child: MaterialApp(
          home: YourWidgetToTest(), // エラー状態で表示するウィジェット
        ),
      ),
    );

  // エラー表示が期待通りに表示されていることを確認するテストコードを記
