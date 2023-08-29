import 'package:search_repo/domain/types/repo_model.dart';

/// アプリの初期準備をする
class InitAppUsecase {
  InitAppUsecase({
    required this.listNotifier,
  });

  final Future<RepoModel> listNotifier;

  /// 一連の流れをまとめて実施する
  Future<RepoModel> execute() async {
    return listNotifier;
  }
}
