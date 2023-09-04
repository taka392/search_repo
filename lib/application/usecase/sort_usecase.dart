import 'package:search_repo/application/state/repo/repo.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/domain/types/sort_enum.dart';
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
  final Sort value;


  /// 一連の流れをまとめて実施する
  Future<void> sort() async {
    //選択されたテキストで新しいリポジトリを取得
    RepoModel data = await repo.getRepo();
    //SortのState値を更新
    sortNotifier.save(value);
    //リポジトリのState値を更新
    repoNotifier.save(data);
  }
}