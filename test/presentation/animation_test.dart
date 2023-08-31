import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/di/repo_di.dart';
import 'package:search_repo/application/state/repo.dart';
import 'package:search_repo/application/usecase/initial.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/post_api.dart';
import 'package:search_repo/presentation/widget/repo_list.dart';
import '../infrastructure/http_server_test.mocks.dart';
import '../domain/mock_data.dart';
import 'package:http/http.dart' as http;
void main() {
  group('AsyncValue型のテスト', () {
    testWidgets('loadingのテスト', (WidgetTester tester) async {
      //repoModelの状態をloadingに設定
      const status = AsyncValue<RepoModel>.loading();
      await tester.pumpWidget(
         const ProviderScope(overrides: [
        ], child: RepoList(repoData: status)),
      );

    });
  });
}

