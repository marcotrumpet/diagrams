// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_barrier_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UpdateBarrierModelTearOff {
  const _$UpdateBarrierModelTearOff();

  _UpdateBarrierModel call(
      {required AbstractFlowElement abstractFlowElement,
      List<Offset>? endPointsToExclude}) {
    return _UpdateBarrierModel(
      abstractFlowElement: abstractFlowElement,
      endPointsToExclude: endPointsToExclude,
    );
  }
}

/// @nodoc
const $UpdateBarrierModel = _$UpdateBarrierModelTearOff();

/// @nodoc
mixin _$UpdateBarrierModel {
  AbstractFlowElement get abstractFlowElement =>
      throw _privateConstructorUsedError;
  List<Offset>? get endPointsToExclude => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateBarrierModelCopyWith<UpdateBarrierModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateBarrierModelCopyWith<$Res> {
  factory $UpdateBarrierModelCopyWith(
          UpdateBarrierModel value, $Res Function(UpdateBarrierModel) then) =
      _$UpdateBarrierModelCopyWithImpl<$Res>;
  $Res call(
      {AbstractFlowElement abstractFlowElement,
      List<Offset>? endPointsToExclude});
}

/// @nodoc
class _$UpdateBarrierModelCopyWithImpl<$Res>
    implements $UpdateBarrierModelCopyWith<$Res> {
  _$UpdateBarrierModelCopyWithImpl(this._value, this._then);

  final UpdateBarrierModel _value;
  // ignore: unused_field
  final $Res Function(UpdateBarrierModel) _then;

  @override
  $Res call({
    Object? abstractFlowElement = freezed,
    Object? endPointsToExclude = freezed,
  }) {
    return _then(_value.copyWith(
      abstractFlowElement: abstractFlowElement == freezed
          ? _value.abstractFlowElement
          : abstractFlowElement // ignore: cast_nullable_to_non_nullable
              as AbstractFlowElement,
      endPointsToExclude: endPointsToExclude == freezed
          ? _value.endPointsToExclude
          : endPointsToExclude // ignore: cast_nullable_to_non_nullable
              as List<Offset>?,
    ));
  }
}

/// @nodoc
abstract class _$UpdateBarrierModelCopyWith<$Res>
    implements $UpdateBarrierModelCopyWith<$Res> {
  factory _$UpdateBarrierModelCopyWith(
          _UpdateBarrierModel value, $Res Function(_UpdateBarrierModel) then) =
      __$UpdateBarrierModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {AbstractFlowElement abstractFlowElement,
      List<Offset>? endPointsToExclude});
}

/// @nodoc
class __$UpdateBarrierModelCopyWithImpl<$Res>
    extends _$UpdateBarrierModelCopyWithImpl<$Res>
    implements _$UpdateBarrierModelCopyWith<$Res> {
  __$UpdateBarrierModelCopyWithImpl(
      _UpdateBarrierModel _value, $Res Function(_UpdateBarrierModel) _then)
      : super(_value, (v) => _then(v as _UpdateBarrierModel));

  @override
  _UpdateBarrierModel get _value => super._value as _UpdateBarrierModel;

  @override
  $Res call({
    Object? abstractFlowElement = freezed,
    Object? endPointsToExclude = freezed,
  }) {
    return _then(_UpdateBarrierModel(
      abstractFlowElement: abstractFlowElement == freezed
          ? _value.abstractFlowElement
          : abstractFlowElement // ignore: cast_nullable_to_non_nullable
              as AbstractFlowElement,
      endPointsToExclude: endPointsToExclude == freezed
          ? _value.endPointsToExclude
          : endPointsToExclude // ignore: cast_nullable_to_non_nullable
              as List<Offset>?,
    ));
  }
}

/// @nodoc

class _$_UpdateBarrierModel implements _UpdateBarrierModel {
  const _$_UpdateBarrierModel(
      {required this.abstractFlowElement, this.endPointsToExclude});

  @override
  final AbstractFlowElement abstractFlowElement;
  @override
  final List<Offset>? endPointsToExclude;

  @override
  String toString() {
    return 'UpdateBarrierModel(abstractFlowElement: $abstractFlowElement, endPointsToExclude: $endPointsToExclude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateBarrierModel &&
            const DeepCollectionEquality()
                .equals(other.abstractFlowElement, abstractFlowElement) &&
            const DeepCollectionEquality()
                .equals(other.endPointsToExclude, endPointsToExclude));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(abstractFlowElement),
      const DeepCollectionEquality().hash(endPointsToExclude));

  @JsonKey(ignore: true)
  @override
  _$UpdateBarrierModelCopyWith<_UpdateBarrierModel> get copyWith =>
      __$UpdateBarrierModelCopyWithImpl<_UpdateBarrierModel>(this, _$identity);
}

abstract class _UpdateBarrierModel implements UpdateBarrierModel {
  const factory _UpdateBarrierModel(
      {required AbstractFlowElement abstractFlowElement,
      List<Offset>? endPointsToExclude}) = _$_UpdateBarrierModel;

  @override
  AbstractFlowElement get abstractFlowElement;
  @override
  List<Offset>? get endPointsToExclude;
  @override
  @JsonKey(ignore: true)
  _$UpdateBarrierModelCopyWith<_UpdateBarrierModel> get copyWith =>
      throw _privateConstructorUsedError;
}
