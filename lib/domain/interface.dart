import 'package:search_repo/application/types/sort_enum.dart';

/// リポジトリインターフェイスの実装
abstract class Repo {
  Future getRepo();
  Future addRepo();
  Future searchRepo(String data);
  Future refreshRepo();
  Future sortRepo(Sort data);
}