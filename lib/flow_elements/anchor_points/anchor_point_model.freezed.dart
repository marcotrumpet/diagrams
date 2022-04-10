// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'anchor_point_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnchorPointModel _$AnchorPointModelFromJson(Map<String, dynamic> json) {
  return _AnchorPointModel.fromJson(json);
}

/// @nodoc
class _$AnchorPointModelTearOff {
  const _$AnchorPointModelTearOff();

  _AnchorPointModel call(
      {@JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
          required Key anchorPointKey,
      @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          required Offset anchorPointPosition,
      @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          required Offset anchorPointPositionRelativeToParent,
      @JsonKey(toJson: alignmentToJson, fromJson: alignmentFromJson)
          required Alignment alignment,
      List<ArrowModel>? arrowModelStart,
      List<ArrowModel>? arrowModelEnd,
      @JsonKey(ignore: true)
          Widget? child}) {
    return _AnchorPointModel(
      anchorPointKey: anchorPointKey,
      anchorPointPosition: anchorPointPosition,
      anchorPointPositionRelativeToParent: anchorPointPositionRelativeToParent,
      alignment: alignment,
      arrowModelStart: arrowModelStart,
      arrowModelEnd: arrowModelEnd,
      child: child,
    );
  }

  AnchorPointModel fromJson(Map<String, Object?> json) {
    return AnchorPointModel.fromJson(json);
  }
}

/// @nodoc
const $AnchorPointModel = _$AnchorPointModelTearOff();

/// @nodoc
mixin _$AnchorPointModel {
  @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
  Key get anchorPointKey => throw _privateConstructorUsedError;
  @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
  Offset get anchorPointPosition => throw _privateConstructorUsedError;
  @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
  Offset get anchorPointPositionRelativeToParent =>
      throw _privateConstructorUsedError;
  @JsonKey(toJson: alignmentToJson, fromJson: alignmentFromJson)
  Alignment get alignment => throw _privateConstructorUsedError;
  List<ArrowModel>? get arrowModelStart => throw _privateConstructorUsedError;
  List<ArrowModel>? get arrowModelEnd => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Widget? get child => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnchorPointModelCopyWith<AnchorPointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnchorPointModelCopyWith<$Res> {
  factory $AnchorPointModelCopyWith(
          AnchorPointModel value, $Res Function(AnchorPointModel) then) =
      _$AnchorPointModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
          Key anchorPointKey,
      @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          Offset anchorPointPosition,
      @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          Offset anchorPointPositionRelativeToParent,
      @JsonKey(toJson: alignmentToJson, fromJson: alignmentFromJson)
          Alignment alignment,
      List<ArrowModel>? arrowModelStart,
      List<ArrowModel>? arrowModelEnd,
      @JsonKey(ignore: true)
          Widget? child});
}

/// @nodoc
class _$AnchorPointModelCopyWithImpl<$Res>
    implements $AnchorPointModelCopyWith<$Res> {
  _$AnchorPointModelCopyWithImpl(this._value, this._then);

  final AnchorPointModel _value;
  // ignore: unused_field
  final $Res Function(AnchorPointModel) _then;

  @override
  $Res call({
    Object? anchorPointKey = freezed,
    Object? anchorPointPosition = freezed,
    Object? anchorPointPositionRelativeToParent = freezed,
    Object? alignment = freezed,
    Object? arrowModelStart = freezed,
    Object? arrowModelEnd = freezed,
    Object? child = freezed,
  }) {
    return _then(_value.copyWith(
      anchorPointKey: anchorPointKey == freezed
          ? _value.anchorPointKey
          : anchorPointKey // ignore: cast_nullable_to_non_nullable
              as Key,
      anchorPointPosition: anchorPointPosition == freezed
          ? _value.anchorPointPosition
          : anchorPointPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      anchorPointPositionRelativeToParent: anchorPointPositionRelativeToParent ==
              freezed
          ? _value.anchorPointPositionRelativeToParent
          : anchorPointPositionRelativeToParent // ignore: cast_nullable_to_non_nullable
              as Offset,
      alignment: alignment == freezed
          ? _value.alignment
          : alignment // ignore: cast_nullable_to_non_nullable
              as Alignment,
      arrowModelStart: arrowModelStart == freezed
          ? _value.arrowModelStart
          : arrowModelStart // ignore: cast_nullable_to_non_nullable
              as List<ArrowModel>?,
      arrowModelEnd: arrowModelEnd == freezed
          ? _value.arrowModelEnd
          : arrowModelEnd // ignore: cast_nullable_to_non_nullable
              as List<ArrowModel>?,
      child: child == freezed
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget?,
    ));
  }
}

/// @nodoc
abstract class _$AnchorPointModelCopyWith<$Res>
    implements $AnchorPointModelCopyWith<$Res> {
  factory _$AnchorPointModelCopyWith(
          _AnchorPointModel value, $Res Function(_AnchorPointModel) then) =
      __$AnchorPointModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
          Key anchorPointKey,
      @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          Offset anchorPointPosition,
      @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          Offset anchorPointPositionRelativeToParent,
      @JsonKey(toJson: alignmentToJson, fromJson: alignmentFromJson)
          Alignment alignment,
      List<ArrowModel>? arrowModelStart,
      List<ArrowModel>? arrowModelEnd,
      @JsonKey(ignore: true)
          Widget? child});
}

/// @nodoc
class __$AnchorPointModelCopyWithImpl<$Res>
    extends _$AnchorPointModelCopyWithImpl<$Res>
    implements _$AnchorPointModelCopyWith<$Res> {
  __$AnchorPointModelCopyWithImpl(
      _AnchorPointModel _value, $Res Function(_AnchorPointModel) _then)
      : super(_value, (v) => _then(v as _AnchorPointModel));

  @override
  _AnchorPointModel get _value => super._value as _AnchorPointModel;

  @override
  $Res call({
    Object? anchorPointKey = freezed,
    Object? anchorPointPosition = freezed,
    Object? anchorPointPositionRelativeToParent = freezed,
    Object? alignment = freezed,
    Object? arrowModelStart = freezed,
    Object? arrowModelEnd = freezed,
    Object? child = freezed,
  }) {
    return _then(_AnchorPointModel(
      anchorPointKey: anchorPointKey == freezed
          ? _value.anchorPointKey
          : anchorPointKey // ignore: cast_nullable_to_non_nullable
              as Key,
      anchorPointPosition: anchorPointPosition == freezed
          ? _value.anchorPointPosition
          : anchorPointPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      anchorPointPositionRelativeToParent: anchorPointPositionRelativeToParent ==
              freezed
          ? _value.anchorPointPositionRelativeToParent
          : anchorPointPositionRelativeToParent // ignore: cast_nullable_to_non_nullable
              as Offset,
      alignment: alignment == freezed
          ? _value.alignment
          : alignment // ignore: cast_nullable_to_non_nullable
              as Alignment,
      arrowModelStart: arrowModelStart == freezed
          ? _value.arrowModelStart
          : arrowModelStart // ignore: cast_nullable_to_non_nullable
              as List<ArrowModel>?,
      arrowModelEnd: arrowModelEnd == freezed
          ? _value.arrowModelEnd
          : arrowModelEnd // ignore: cast_nullable_to_non_nullable
              as List<ArrowModel>?,
      child: child == freezed
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_AnchorPointModel implements _AnchorPointModel {
  _$_AnchorPointModel(
      {@JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
          required this.anchorPointKey,
      @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          required this.anchorPointPosition,
      @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          required this.anchorPointPositionRelativeToParent,
      @JsonKey(toJson: alignmentToJson, fromJson: alignmentFromJson)
          required this.alignment,
      this.arrowModelStart,
      this.arrowModelEnd,
      @JsonKey(ignore: true)
          this.child});

  factory _$_AnchorPointModel.fromJson(Map<String, dynamic> json) =>
      _$$_AnchorPointModelFromJson(json);

  @override
  @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
  final Key anchorPointKey;
  @override
  @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
  final Offset anchorPointPosition;
  @override
  @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
  final Offset anchorPointPositionRelativeToParent;
  @override
  @JsonKey(toJson: alignmentToJson, fromJson: alignmentFromJson)
  final Alignment alignment;
  @override
  final List<ArrowModel>? arrowModelStart;
  @override
  final List<ArrowModel>? arrowModelEnd;
  @override
  @JsonKey(ignore: true)
  final Widget? child;

  @override
  String toString() {
    return 'AnchorPointModel(anchorPointKey: $anchorPointKey, anchorPointPosition: $anchorPointPosition, anchorPointPositionRelativeToParent: $anchorPointPositionRelativeToParent, alignment: $alignment, arrowModelStart: $arrowModelStart, arrowModelEnd: $arrowModelEnd, child: $child)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnchorPointModel &&
            const DeepCollectionEquality()
                .equals(other.anchorPointKey, anchorPointKey) &&
            const DeepCollectionEquality()
                .equals(other.anchorPointPosition, anchorPointPosition) &&
            const DeepCollectionEquality().equals(
                other.anchorPointPositionRelativeToParent,
                anchorPointPositionRelativeToParent) &&
            const DeepCollectionEquality().equals(other.alignment, alignment) &&
            const DeepCollectionEquality()
                .equals(other.arrowModelStart, arrowModelStart) &&
            const DeepCollectionEquality()
                .equals(other.arrowModelEnd, arrowModelEnd) &&
            const DeepCollectionEquality().equals(other.child, child));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(anchorPointKey),
      const DeepCollectionEquality().hash(anchorPointPosition),
      const DeepCollectionEquality().hash(anchorPointPositionRelativeToParent),
      const DeepCollectionEquality().hash(alignment),
      const DeepCollectionEquality().hash(arrowModelStart),
      const DeepCollectionEquality().hash(arrowModelEnd),
      const DeepCollectionEquality().hash(child));

  @JsonKey(ignore: true)
  @override
  _$AnchorPointModelCopyWith<_AnchorPointModel> get copyWith =>
      __$AnchorPointModelCopyWithImpl<_AnchorPointModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnchorPointModelToJson(this);
  }
}

abstract class _AnchorPointModel implements AnchorPointModel {
  factory _AnchorPointModel(
      {@JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
          required Key anchorPointKey,
      @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          required Offset anchorPointPosition,
      @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          required Offset anchorPointPositionRelativeToParent,
      @JsonKey(toJson: alignmentToJson, fromJson: alignmentFromJson)
          required Alignment alignment,
      List<ArrowModel>? arrowModelStart,
      List<ArrowModel>? arrowModelEnd,
      @JsonKey(ignore: true)
          Widget? child}) = _$_AnchorPointModel;

  factory _AnchorPointModel.fromJson(Map<String, dynamic> json) =
      _$_AnchorPointModel.fromJson;

  @override
  @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
  Key get anchorPointKey;
  @override
  @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
  Offset get anchorPointPosition;
  @override
  @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
  Offset get anchorPointPositionRelativeToParent;
  @override
  @JsonKey(toJson: alignmentToJson, fromJson: alignmentFromJson)
  Alignment get alignment;
  @override
  List<ArrowModel>? get arrowModelStart;
  @override
  List<ArrowModel>? get arrowModelEnd;
  @override
  @JsonKey(ignore: true)
  Widget? get child;
  @override
  @JsonKey(ignore: true)
  _$AnchorPointModelCopyWith<_AnchorPointModel> get copyWith =>
      throw _privateConstructorUsedError;
}
