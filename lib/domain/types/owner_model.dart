import 'package:freezed_annotation/freezed_annotation.dart';
part 'owner_model.freezed.dart';
@freezed
class OwnerModel with _$OwnerModel {
  const factory OwnerModel({
    required String avatarUrl,
    required String htmlUrl,
  }) = _OwnerModel;
  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      avatarUrl: json['avatar_url']??'NoImage',
      htmlUrl: json['html_url']??'No_html',
    );
  }
}