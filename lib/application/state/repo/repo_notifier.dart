import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/domain/types/repo_model.dart';

class RepoNotifier<T> extends StateNotifier<AsyncValue<T>> {
  RepoNotifier() : super(const AsyncValue.loading());

  Future<void> save(T data) async {
    state = AsyncValue.data(data);
  }

  Future<void> add(T data) async {
    state = state.when(
      data: (existingData) {
        // エラーチェックと型変換が必要
        if (existingData is RepoModel && data is RepoModel) {
          return AsyncValue.data(
            RepoModel(
              items: [...existingData.items, ...data.items],
              totalCount: data.totalCount,
            ) as T,
          );
        } else {
          return state; // エラーまたは不正な型の場合、現在の状態を返す
        }
      },
      loading: () => state,
      error: (error, stackTrace) => state,
    );
  }

  void refresh() {
    state = const AsyncValue.loading();
  }

  void loadingText() {
    state = const AsyncValue.loading();
  }

  void errorText() {
    final fakeStackTrace =
        StackTrace.fromString('Fake stack trace'); // ダミーのスタックトレースを生成
    state = AsyncValue.error("エラーメッセージ", fakeStackTrace);
  }
}
