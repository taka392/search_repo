import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_code/domain/types/item.dart';
part 'api.freezed.dart';

@freezed
class Api with _$Api {
  const factory Api({
    required int totalCount,
    required List<Item> items,
  }) = _Api;

  factory Api.fromJson(Map<String, dynamic> json) {
    List<dynamic> itemsJson = json['items'];
    List<Item> items = itemsJson.map((json) => Item.fromJson(json)).toList();
    return Api(
      totalCount: json['total_count'] ?? 0,
      items: items,
    );
  }
}
