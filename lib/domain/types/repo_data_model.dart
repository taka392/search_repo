import 'package:freezed_annotation/freezed_annotation.dart';
part 'repo_data_model.freezed.dart';

@freezed
class RepoDataModel with _$RepoDataModel {
  const factory RepoDataModel({
    required int totalCount,
    required List<Item> items,
  }) = _RepoDataModel;

  factory RepoDataModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> itemsJson = json['items'];
    List<Item> items = itemsJson.map((json) => Item.fromJson(json)).toList();
    return RepoDataModel(
      totalCount: json['total_count'] ?? 0,
      items: items,
    );
  }
}
