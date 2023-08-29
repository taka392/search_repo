
//initial
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repo/application/di/post_repo_imt.dart';
import 'package:search_repo/application/usecase/initial.dart';
import 'package:search_repo/infrastructure/repo/http_cliant.dart';
import 'package:search_repo/infrastructure/repo/post_api.dart';

final initAppProvider = Provider<InitAppUsecase>(
      (ref) {
    final http = ref.watch(httpClientProvider);
    final apiData = ApiPostDataSource(http);
    final listNotifier = PostRepositoryImpl(apiData).getPosts();
    return InitAppUsecase(
      listNotifier: listNotifier,
    );
  },
);