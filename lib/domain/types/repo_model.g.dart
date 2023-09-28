// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepoModel _$$_RepoModelFromJson(Map<String, dynamic> json) => _$_RepoModel(
      totalCount: json['total_count'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RepoModelToJson(_$_RepoModel instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'items': instance.items,
    };

_$_ItemModel _$$_ItemModelFromJson(Map<String, dynamic> json) => _$_ItemModel(
      id: json['id'] as int,
      fullName: json['full_name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      stargazersCount: json['stargazers_count'] as int? ?? 0,
      watchersCount: json['watchers_count'] as int? ?? 0,
      forksCount: json['forks_count'] as int? ?? 0,
      openIssuesCount: json['open_issues_count'] as int? ?? 0,
      language: json['language'] as String? ?? '',
      owner: OwnerModel.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ItemModelToJson(_$_ItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'description': instance.description,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'forks_count': instance.forksCount,
      'open_issues_count': instance.openIssuesCount,
      'language': instance.language,
      'owner': instance.owner,
    };

_$_OwnerModel _$$_OwnerModelFromJson(Map<String, dynamic> json) =>
    _$_OwnerModel(
      avatarUrl: json['avatar_url'] as String? ?? '',
    );

Map<String, dynamic> _$$_OwnerModelToJson(_$_OwnerModel instance) =>
    <String, dynamic>{
      'avatar_url': instance.avatarUrl,
    };
