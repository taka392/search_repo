// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'repo_model.freezed.dart';
part 'repo_model.g.dart';

@freezed
class RepoModel with _$RepoModel {
  const factory RepoModel({
    @JsonKey(name: 'total_count') required int totalCount,
    required List<ItemModel> items,
  }) = _RepoModel;

  factory RepoModel.fromJson(Map<String, dynamic> json) =>
      _$RepoModelFromJson(json);
}

@freezed
class ItemModel with _$ItemModel {
  const factory ItemModel({
    required int id,
    @Default('') @JsonKey(name: 'full_name') String fullName,
    @Default('') String description,
    @Default(0) @JsonKey(name: 'stargazers_count') int stargazersCount,
    @Default(0) @JsonKey(name: 'watchers_count') int watchersCount,
    @Default(0) @JsonKey(name: 'forks_count') int forksCount,
    @Default(0) @JsonKey(name: 'open_issues_count') int openIssuesCount,
    @Default('') String language,
    required OwnerModel owner,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}

@freezed
class OwnerModel with _$OwnerModel {
  const factory OwnerModel({
    @Default('') @JsonKey(name: 'avatar_url') String avatarUrl,
  }) = _OwnerModel;

  factory OwnerModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerModelFromJson(json);
}
