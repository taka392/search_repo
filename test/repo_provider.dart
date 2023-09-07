import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/domain/types/repo_model.dart';

class MockRepoProvider extends Mock implements RepoNotifier {
  @override
  final AsyncValue<RepoModel> state;
  // コンストラクタでモックの初期状態を設定
  MockRepoProvider.loading() : state = const AsyncValue.loading();
}

