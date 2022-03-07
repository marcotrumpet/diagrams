// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'barrier_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BarrierModelTearOff {
  const _$BarrierModelTearOff();

  _BarrierModel call(
      {required Key abstractElementKey,
      required List<Offset> positions,
      required Rect rect}) {
    return _BarrierModel(
      abstractElementKey: abstractElementKey,
      positions: positions,
      rect: rect,
    );
  }
}

/// @nodoc
const $BarrierModel = _$BarrierModelTearOff();

/// @nodoc
mixin _$BarrierModel {
  Key get abstractElementKey => throw _privateConstructorUsedError;
  List<Offset> get positions => throw _privateConstructorUsedError;
  Rect get rect => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BarrierModelCopyWith<BarrierModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarrierModelCopyWith<$Res> {
  factory $BarrierModelCopyWith(
          BarrierModel value, $Res Function(BarrierModel) then) =
      _$BarrierModelCopyWithImpl<$Res>;
  $Res call({Key abstractElementKey, List<Offset> positions, Rect rect});
}

/// @nodoc
class _$BarrierModelCopyWithImpl<$Res> implements $BarrierModelCopyWith<$Res> {
  _$BarrierModelCopyWithImpl(this._value, this._then);

  final BarrierModel _value;
  // ignore: unused_field
  final $Res Function(BarrierModel) _then;

  @override
  $Res call({
    Object? abstractElementKey = freezed,
    Object? positions = freezed,
    Object? rect = freezed,
  }) {
    return _then(_value.copyWith(
      abstractElementKey: abstractElementKey == freezed
          ? _value.abstractElementKey
          : abstractElementKey // ignore: cast_nullable_to_non_nullable
              as Key,
      positions: positions == freezed
          ? _value.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
      rect: rect == freezed
          ? _value.rect
          : rect // ignore: cast_nullable_to_non_nullable
              as Rect,
    ));
  }
}

/// @nodoc
abstract class _$BarrierModelCopyWith<$Res>
    implements $BarrierModelCopyWith<$Res> {
  factory _$BarrierModelCopyWith(
          _BarrierModel value, $Res Function(_BarrierModel) then) =
      __$BarrierModelCopyWithImpl<$Res>;
  @override
  $Res call({Key abstractElementKey, List<Offset> positions, Rect rect});
}

/// @nodoc
class __$BarrierModelCopyWithImpl<$Res> extends _$BarrierModelCopyWithImpl<$Res>
    implements _$BarrierModelCopyWith<$Res> {
  __$BarrierModelCopyWithImpl(
      _BarrierModel _value, $Res Function(_BarrierModel) _then)
      : super(_value, (v) => _then(v as _BarrierModel));

  @override
  _BarrierModel get _value => super._value as _BarrierModel;

  @override
  $Res call({
    Object? abstractElementKey = freezed,
    Object? positions = freezed,
    Object? rect = freezed,
  }) {
    return _then(_BarrierModel(
      abstractElementKey: abstractElementKey == freezed
          ? _value.abstractElementKey
          : abstractElementKey // ignore: cast_nullable_to_non_nullable
              as Key,
      positions: positions == freezed
          ? _value.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
      rect: rect == freezed
          ? _value.rect
          : rect // ignore: cast_nullable_to_non_nullable
              as Rect,
    ));
  }
}

/// @nodoc

class _$_BarrierModel with DiagnosticableTreeMixin implements _BarrierModel {
  const _$_BarrierModel(
      {required this.abstractElementKey,
      required this.positions,
      required this.rect});

  @override
  final Key abstractElementKey;
  @override
  final List<Offset> positions;
  @override
  final Rect rect;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BarrierModel(abstractElementKey: $abstractElementKey, positions: $positions, rect: $rect)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BarrierModel'))
      ..add(DiagnosticsProperty('abstractElementKey', abstractElementKey))
      ..add(DiagnosticsProperty('positions', positions))
      ..add(DiagnosticsProperty('rect', rect));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BarrierModel &&
            const DeepCollectionEquality()
                .equals(other.abstractElementKey, abstractElementKey) &&
            const DeepCollectionEquality().equals(other.positions, positions) &&
            const DeepCollectionEquality().equals(other.rect, rect));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(abstractElementKey),
      const DeepCollectionEquality().hash(positions),
      const DeepCollectionEquality().hash(rect));

  @JsonKey(ignore: true)
  @override
  _$BarrierModelCopyWith<_BarrierModel> get copyWith =>
      __$BarrierModelCopyWithImpl<_BarrierModel>(this, _$identity);
}

abstract class _BarrierModel implements BarrierModel {
  const factory _BarrierModel(
      {required Key abstractElementKey,
      required List<Offset> positions,
      required Rect rect}) = _$_BarrierModel;

  @override
  Key get abstractElementKey;
  @override
  List<Offset> get positions;
  @override
  Rect get rect;
  @override
  @JsonKey(ignore: true)
  _$BarrierModelCopyWith<_BarrierModel> get copyWith =>
      throw _privateConstructorUsedError;
}
