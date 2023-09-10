import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/state/page/page.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/domain/interface.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';

///リポジトリインスタンスを取得する。
final repositoryProvider = Provider<Repo>((ref) {
  final httpClient = ref.watch(httpClientProvider);
  final page = ref.watch(pageNotifierProvider);
  final search = ref.watch(searchNotifierProvider);
  final sort = ref.watch(sortNotifierProvider);
  return RepoImpl(
      httpClient: httpClient, page: page, search: search, sort: sort);
});
