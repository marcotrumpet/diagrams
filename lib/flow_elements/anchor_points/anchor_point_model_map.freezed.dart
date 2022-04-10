// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'anchor_point_model_map.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnchorPointModelMap _$AnchorPointModelMapFromJson(Map<String, dynamic> json) {
  return _AnchorPointModelMap.fromJson(json);
}

/// @nodoc
class _$AnchorPointModelMapTearOff {
  const _$AnchorPointModelMapTearOff();

  _AnchorPointModelMap call({required List<AnchorPointModel> anchorPointList}) {
    return _AnchorPointModelMap(
      anchorPointList: anchorPointList,
    );
  }

  AnchorPointModelMap fromJson(Map<String, Object?> json) {
    return AnchorPointModelMap.fromJson(json);
  }
}

/// @nodoc
const $AnchorPointModelMap = _$AnchorPointModelMapTearOff();

/// @nodoc
mixin _$AnchorPointModelMap {
  List<AnchorPointModel> get anchorPointList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnchorPointModelMapCopyWith<AnchorPointModelMap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnchorPointModelMapCopyWith<$Res> {
  factory $AnchorPointModelMapCopyWith(
          AnchorPointModelMap value, $Res Function(AnchorPointModelMap) then) =
      _$AnchorPointModelMapCopyWithImpl<$Res>;
  $Res call({List<AnchorPointModel> anchorPointList});
}

/// @nodoc
class _$AnchorPointModelMapCopyWithImpl<$Res>
    implements $AnchorPointModelMapCopyWith<$Res> {
  _$AnchorPointModelMapCopyWithImpl(this._value, this._then);

  final AnchorPointModelMap _value;
  // ignore: unused_field
  final $Res Function(AnchorPointModelMap) _then;

  @override
  $Res call({
    Object? anchorPointList = freezed,
  }) {
    return _then(_value.copyWith(
      anchorPointList: anchorPointList == freezed
          ? _value.anchorPointList
          : anchorPointList // ignore: cast_nullable_to_non_nullable
              as List<AnchorPointModel>,
    ));
  }
}

/// @nodoc
abstract class _$AnchorPointModelMapCopyWith<$Res>
    implements $AnchorPointModelMapCopyWith<$Res> {
  factory _$AnchorPointModelMapCopyWith(_AnchorPointModelMap value,
          $Res Function(_AnchorPointModelMap) then) =
      __$AnchorPointModelMapCopyWithImpl<$Res>;
  @override
  $Res call({List<AnchorPointModel> anchorPointList});
}

/// @nodoc
class __$AnchorPointModelMapCopyWithImpl<$Res>
    extends _$AnchorPointModelMapCopyWithImpl<$Res>
    implements _$AnchorPointModelMapCopyWith<$Res> {
  __$AnchorPointModelMapCopyWithImpl(
      _AnchorPointModelMap _value, $Res Function(_AnchorPointModelMap) _then)
      : super(_value, (v) => _then(v as _AnchorPointModelMap));

  @override
  _AnchorPointModelMap get _value => super._value as _AnchorPointModelMap;

  @override
  $Res call({
    Object? anchorPointList = freezed,
  }) {
    return _then(_AnchorPointModelMap(
      anchorPointList: anchorPointList == freezed
          ? _value.anchorPointList
          : anchorPointList // ignore: cast_nullable_to_non_nullable
              as List<AnchorPointModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnchorPointModelMap implements _AnchorPointModelMap {
  const _$_AnchorPointModelMap({required this.anchorPointList});

  factory _$_AnchorPointModelMap.fromJson(Map<String, dynamic> json) =>
      _$$_AnchorPointModelMapFromJson(json);

  @override
  final List<AnchorPointModel> anchorPointList;

  @override
  String toString() {
    return 'AnchorPointModelMap(anchorPointList: $anchorPointList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnchorPointModelMap &&
            const DeepCollectionEquality()
                .equals(other.anchorPointList, anchorPointList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(anchorPointList));

  @JsonKey(ignore: true)
  @override
  _$AnchorPointModelMapCopyWith<_AnchorPointModelMap> get copyWith =>
      __$AnchorPointModelMapCopyWithImpl<_AnchorPointModelMap>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnchorPointModelMapToJson(this);
  }
}

abstract class _AnchorPointModelMap implements AnchorPointModelMap {
  const factory _AnchorPointModelMap(
          {required List<AnchorPointModel> anchorPointList}) =
      _$_AnchorPointModelMap;

  factory _AnchorPointModelMap.fromJson(Map<String, dynamic> json) =
      _$_AnchorPointModelMap.fromJson;

  @override
  List<AnchorPointModel> get anchorPointList;
  @override
  @JsonKey(ignore: true)
  _$AnchorPointModelMapCopyWith<_AnchorPointModelMap> get copyWith =>
      throw _privateConstructorUsedError;
}
