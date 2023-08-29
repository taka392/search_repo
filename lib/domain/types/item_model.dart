import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:search_repo/domain/types/owner_model.dart';
part 'item_model.freezed.dart';


@freezed
class ItemModel with _$ItemModel {
  const factory ItemModel({
    required int id,
    required String nodeId,
    required String name,
    required String fullName,
    required OwnerModel owner,
    required String description,
    required int stargazersCount,
    required int forksCount,

  }) = _ItemModel;
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    OwnerModel owner = OwnerModel.fromJson(json['owner']); // Owner オブジェクトとして解析
    return ItemModel(
      id: json['id'] ?? 0,
      nodeId: json['node_id'] ?? 'NO_node_id',
      name: json['name']??'No_name',
      fullName: json['full_name']??'No_fullName',
      owner: owner,
      description: json['description']?? 'No_description',
      stargazersCount:  json['stargazers_count']??0,
      forksCount: json['forks_count']??0,
    );
  }
}

