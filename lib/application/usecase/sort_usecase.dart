import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/application/state/search/search.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/repo.dart';



/// アプリの初期準備をする
class SortUsecase {
  SortUsecase({
    required this.repo,
    required this.sortNotifier,
    required this.repoNotifier,
    required this.value,
    //以前のページ
  });
  final Repo repo;
  final SortNotifier sortNotifier;
  final RepoNotifier repoNotifier;
  final String value;


  /// 一連の流れをまとめて実施する
  Future<void> search() async {
    //選択されたテキストで新しいリポジトリを取得
    RepoModel data = await repo.getRepo();
    //リポジトリのState値を更新
    repoNotifier.save(data);
    //SortのState値を更新
    sortNotifier.save(value);
  }
}