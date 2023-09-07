import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/repo/repo_notifier.dart';
import 'package:search_repo/domain/types/repo_model.dart';


final repoProvider = StateNotifierProvider<RepoNotifier, CustomAsyncValue<RepoModel>>(
      (ref) => RepoNotifier(),
);




