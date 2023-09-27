import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:search_repo/domain/types/item/item_model.dart';
part 'repo_model.freezed.dart';

@freezed
class RepoModel with _$RepoModel {
  const factory RepoModel({
    required int totalCount,
    required List<ItemModel> items,
  }) = _RepoModel;

  factory RepoModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> itemsJson = json['items'];
    final List<ItemModel> items = itemsJson.map((json) => ItemModel.fromJson(json)).toList();
    return RepoModel(
      totalCount: json['total_count'] ?? 0,
      items: items,
    );
  }
}


/*下記コマンドを実行
flutter pub run build_runner build --delete-conflicting-outputs*/
