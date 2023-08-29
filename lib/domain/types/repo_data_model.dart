import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:search_repo/domain/types/items_data_model.dart';
part 'repo_model.freezed.dart';

@freezed
class RepoModel with _$RepoModel {
  const factory RepoDataModel({
    required int totalCount,
    required List<Item> items,
  }) = _RepoModel;

  factory RepoModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> itemsJson = json['items'];
    List<Item> items = itemsJson.map((json) => Item.fromJson(json)).toList();
    return RepoModel(
      totalCount: json['total_count'] ?? 0,
      items: items,
    );
  }
}
