// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepoModel _$RepoModelFromJson(Map<String, dynamic> json) {
  return _RepoModel.fromJson(json);
}

/// @nodoc
mixin _$RepoModel {
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  List<ItemModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepoModelCopyWith<RepoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoModelCopyWith<$Res> {
  factory $RepoModelCopyWith(RepoModel value, $Res Function(RepoModel) then) =
      _$RepoModelCopyWithImpl<$Res, RepoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount, List<ItemModel> items});
}

/// @nodoc
class _$RepoModelCopyWithImpl<$Res, $Val extends RepoModel>
    implements $RepoModelCopyWith<$Res> {
  _$RepoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RepoModelCopyWith<$Res> implements $RepoModelCopyWith<$Res> {
  factory _$$_RepoModelCopyWith(
          _$_RepoModel value, $Res Function(_$_RepoModel) then) =
      __$$_RepoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount, List<ItemModel> items});
}

/// @nodoc
class __$$_RepoModelCopyWithImpl<$Res>
    extends _$RepoModelCopyWithImpl<$Res, _$_RepoModel>
    implements _$$_RepoModelCopyWith<$Res> {
  __$$_RepoModelCopyWithImpl(
      _$_RepoModel _value, $Res Function(_$_RepoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? items = null,
  }) {
    return _then(_$_RepoModel(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RepoModel implements _RepoModel {
  const _$_RepoModel(
      {@JsonKey(name: 'total_count') required this.totalCount,
      required final List<ItemModel> items})
      : _items = items;

  factory _$_RepoModel.fromJson(Map<String, dynamic> json) =>
      _$$_RepoModelFromJson(json);

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  final List<ItemModel> _items;
  @override
  List<ItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'RepoModel(totalCount: $totalCount, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepoModel &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalCount, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepoModelCopyWith<_$_RepoModel> get copyWith =>
      __$$_RepoModelCopyWithImpl<_$_RepoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepoModelToJson(
      this,
    );
  }
}

abstract class _RepoModel implements RepoModel {
  const factory _RepoModel(
      {@JsonKey(name: 'total_count') required final int totalCount,
      required final List<ItemModel> items}) = _$_RepoModel;

  factory _RepoModel.fromJson(Map<String, dynamic> json) =
      _$_RepoModel.fromJson;

  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  List<ItemModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_RepoModelCopyWith<_$_RepoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) {
  return _ItemModel.fromJson(json);
}

/// @nodoc
mixin _$ItemModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'stargazers_count')
  int get stargazersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'watchers_count')
  int get watchersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'forks_count')
  int get forksCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_issues_count')
  int get openIssuesCount => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  OwnerModel get owner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemModelCopyWith<ItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemModelCopyWith<$Res> {
  factory $ItemModelCopyWith(ItemModel value, $Res Function(ItemModel) then) =
      _$ItemModelCopyWithImpl<$Res, ItemModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'full_name') String fullName,
      String description,
      @JsonKey(name: 'stargazers_count') int stargazersCount,
      @JsonKey(name: 'watchers_count') int watchersCount,
      @JsonKey(name: 'forks_count') int forksCount,
      @JsonKey(name: 'open_issues_count') int openIssuesCount,
      String language,
      OwnerModel owner});

  $OwnerModelCopyWith<$Res> get owner;
}

/// @nodoc
class _$ItemModelCopyWithImpl<$Res, $Val extends ItemModel>
    implements $ItemModelCopyWith<$Res> {
  _$ItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? description = null,
    Object? stargazersCount = null,
    Object? watchersCount = null,
    Object? forksCount = null,
    Object? openIssuesCount = null,
    Object? language = null,
    Object? owner = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchersCount: null == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int,
      forksCount: null == forksCount
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int,
      openIssuesCount: null == openIssuesCount
          ? _value.openIssuesCount
          : openIssuesCount // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as OwnerModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OwnerModelCopyWith<$Res> get owner {
    return $OwnerModelCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ItemModelCopyWith<$Res> implements $ItemModelCopyWith<$Res> {
  factory _$$_ItemModelCopyWith(
          _$_ItemModel value, $Res Function(_$_ItemModel) then) =
      __$$_ItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'full_name') String fullName,
      String description,
      @JsonKey(name: 'stargazers_count') int stargazersCount,
      @JsonKey(name: 'watchers_count') int watchersCount,
      @JsonKey(name: 'forks_count') int forksCount,
      @JsonKey(name: 'open_issues_count') int openIssuesCount,
      String language,
      OwnerModel owner});

  @override
  $OwnerModelCopyWith<$Res> get owner;
}

/// @nodoc
class __$$_ItemModelCopyWithImpl<$Res>
    extends _$ItemModelCopyWithImpl<$Res, _$_ItemModel>
    implements _$$_ItemModelCopyWith<$Res> {
  __$$_ItemModelCopyWithImpl(
      _$_ItemModel _value, $Res Function(_$_ItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? description = null,
    Object? stargazersCount = null,
    Object? watchersCount = null,
    Object? forksCount = null,
    Object? openIssuesCount = null,
    Object? language = null,
    Object? owner = null,
  }) {
    return _then(_$_ItemModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchersCount: null == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int,
      forksCount: null == forksCount
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int,
      openIssuesCount: null == openIssuesCount
          ? _value.openIssuesCount
          : openIssuesCount // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as OwnerModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemModel implements _ItemModel {
  const _$_ItemModel(
      {required this.id,
      @JsonKey(name: 'full_name') this.fullName = '',
      this.description = '',
      @JsonKey(name: 'stargazers_count') this.stargazersCount = 0,
      @JsonKey(name: 'watchers_count') this.watchersCount = 0,
      @JsonKey(name: 'forks_count') this.forksCount = 0,
      @JsonKey(name: 'open_issues_count') this.openIssuesCount = 0,
      this.language = '',
      required this.owner});

  factory _$_ItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_ItemModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey(name: 'stargazers_count')
  final int stargazersCount;
  @override
  @JsonKey(name: 'watchers_count')
  final int watchersCount;
  @override
  @JsonKey(name: 'forks_count')
  final int forksCount;
  @override
  @JsonKey(name: 'open_issues_count')
  final int openIssuesCount;
  @override
  @JsonKey()
  final String language;
  @override
  final OwnerModel owner;

  @override
  String toString() {
    return 'ItemModel(id: $id, fullName: $fullName, description: $description, stargazersCount: $stargazersCount, watchersCount: $watchersCount, forksCount: $forksCount, openIssuesCount: $openIssuesCount, language: $language, owner: $owner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount) &&
            (identical(other.watchersCount, watchersCount) ||
                other.watchersCount == watchersCount) &&
            (identical(other.forksCount, forksCount) ||
                other.forksCount == forksCount) &&
            (identical(other.openIssuesCount, openIssuesCount) ||
                other.openIssuesCount == openIssuesCount) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      description,
      stargazersCount,
      watchersCount,
      forksCount,
      openIssuesCount,
      language,
      owner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemModelCopyWith<_$_ItemModel> get copyWith =>
      __$$_ItemModelCopyWithImpl<_$_ItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemModelToJson(
      this,
    );
  }
}

abstract class _ItemModel implements ItemModel {
  const factory _ItemModel(
      {required final int id,
      @JsonKey(name: 'full_name') final String fullName,
      final String description,
      @JsonKey(name: 'stargazers_count') final int stargazersCount,
      @JsonKey(name: 'watchers_count') final int watchersCount,
      @JsonKey(name: 'forks_count') final int forksCount,
      @JsonKey(name: 'open_issues_count') final int openIssuesCount,
      final String language,
      required final OwnerModel owner}) = _$_ItemModel;

  factory _ItemModel.fromJson(Map<String, dynamic> json) =
      _$_ItemModel.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  String get description;
  @override
  @JsonKey(name: 'stargazers_count')
  int get stargazersCount;
  @override
  @JsonKey(name: 'watchers_count')
  int get watchersCount;
  @override
  @JsonKey(name: 'forks_count')
  int get forksCount;
  @override
  @JsonKey(name: 'open_issues_count')
  int get openIssuesCount;
  @override
  String get language;
  @override
  OwnerModel get owner;
  @override
  @JsonKey(ignore: true)
  _$$_ItemModelCopyWith<_$_ItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

OwnerModel _$OwnerModelFromJson(Map<String, dynamic> json) {
  return _OwnerModel.fromJson(json);
}

/// @nodoc
mixin _$OwnerModel {
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OwnerModelCopyWith<OwnerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerModelCopyWith<$Res> {
  factory $OwnerModelCopyWith(
          OwnerModel value, $Res Function(OwnerModel) then) =
      _$OwnerModelCopyWithImpl<$Res, OwnerModel>;
  @useResult
  $Res call({@JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class _$OwnerModelCopyWithImpl<$Res, $Val extends OwnerModel>
    implements $OwnerModelCopyWith<$Res> {
  _$OwnerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarUrl = null,
  }) {
    return _then(_value.copyWith(
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OwnerModelCopyWith<$Res>
    implements $OwnerModelCopyWith<$Res> {
  factory _$$_OwnerModelCopyWith(
          _$_OwnerModel value, $Res Function(_$_OwnerModel) then) =
      __$$_OwnerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class __$$_OwnerModelCopyWithImpl<$Res>
    extends _$OwnerModelCopyWithImpl<$Res, _$_OwnerModel>
    implements _$$_OwnerModelCopyWith<$Res> {
  __$$_OwnerModelCopyWithImpl(
      _$_OwnerModel _value, $Res Function(_$_OwnerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarUrl = null,
  }) {
    return _then(_$_OwnerModel(
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OwnerModel implements _OwnerModel {
  const _$_OwnerModel({@JsonKey(name: 'avatar_url') this.avatarUrl = ''});

  factory _$_OwnerModel.fromJson(Map<String, dynamic> json) =>
      _$$_OwnerModelFromJson(json);

  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @override
  String toString() {
    return 'OwnerModel(avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OwnerModel &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, avatarUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OwnerModelCopyWith<_$_OwnerModel> get copyWith =>
      __$$_OwnerModelCopyWithImpl<_$_OwnerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OwnerModelToJson(
      this,
    );
  }
}

abstract class _OwnerModel implements OwnerModel {
  const factory _OwnerModel(
      {@JsonKey(name: 'avatar_url') final String avatarUrl}) = _$_OwnerModel;

  factory _OwnerModel.fromJson(Map<String, dynamic> json) =
      _$_OwnerModel.fromJson;

  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;
  @override
  @JsonKey(ignore: true)
  _$$_OwnerModelCopyWith<_$_OwnerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
