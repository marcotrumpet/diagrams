// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'draw_arrows_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DrawArrowsStateTearOff {
  const _$DrawArrowsStateTearOff();

  _DrawArrowState call(
      {List<ArrowModel>? arrowModelList, bool updateAStarPath = false}) {
    return _DrawArrowState(
      arrowModelList: arrowModelList,
      updateAStarPath: updateAStarPath,
    );
  }
}

/// @nodoc
const $DrawArrowsState = _$DrawArrowsStateTearOff();

/// @nodoc
mixin _$DrawArrowsState {
  List<ArrowModel>? get arrowModelList => throw _privateConstructorUsedError;
  bool get updateAStarPath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrawArrowsStateCopyWith<DrawArrowsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawArrowsStateCopyWith<$Res> {
  factory $DrawArrowsStateCopyWith(
          DrawArrowsState value, $Res Function(DrawArrowsState) then) =
      _$DrawArrowsStateCopyWithImpl<$Res>;
  $Res call({List<ArrowModel>? arrowModelList, bool updateAStarPath});
}

/// @nodoc
class _$DrawArrowsStateCopyWithImpl<$Res>
    implements $DrawArrowsStateCopyWith<$Res> {
  _$DrawArrowsStateCopyWithImpl(this._value, this._then);

  final DrawArrowsState _value;
  // ignore: unused_field
  final $Res Function(DrawArrowsState) _then;

  @override
  $Res call({
    Object? arrowModelList = freezed,
    Object? updateAStarPath = freezed,
  }) {
    return _then(_value.copyWith(
      arrowModelList: arrowModelList == freezed
          ? _value.arrowModelList
          : arrowModelList // ignore: cast_nullable_to_non_nullable
              as List<ArrowModel>?,
      updateAStarPath: updateAStarPath == freezed
          ? _value.updateAStarPath
          : updateAStarPath // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$DrawArrowStateCopyWith<$Res>
    implements $DrawArrowsStateCopyWith<$Res> {
  factory _$DrawArrowStateCopyWith(
          _DrawArrowState value, $Res Function(_DrawArrowState) then) =
      __$DrawArrowStateCopyWithImpl<$Res>;
  @override
  $Res call({List<ArrowModel>? arrowModelList, bool updateAStarPath});
}

/// @nodoc
class __$DrawArrowStateCopyWithImpl<$Res>
    extends _$DrawArrowsStateCopyWithImpl<$Res>
    implements _$DrawArrowStateCopyWith<$Res> {
  __$DrawArrowStateCopyWithImpl(
      _DrawArrowState _value, $Res Function(_DrawArrowState) _then)
      : super(_value, (v) => _then(v as _DrawArrowState));

  @override
  _DrawArrowState get _value => super._value as _DrawArrowState;

  @override
  $Res call({
    Object? arrowModelList = freezed,
    Object? updateAStarPath = freezed,
  }) {
    return _then(_DrawArrowState(
      arrowModelList: arrowModelList == freezed
          ? _value.arrowModelList
          : arrowModelList // ignore: cast_nullable_to_non_nullable
              as List<ArrowModel>?,
      updateAStarPath: updateAStarPath == freezed
          ? _value.updateAStarPath
          : updateAStarPath // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DrawArrowState implements _DrawArrowState {
  const _$_DrawArrowState({this.arrowModelList, this.updateAStarPath = false});

  @override
  final List<ArrowModel>? arrowModelList;
  @JsonKey()
  @override
  final bool updateAStarPath;

  @override
  String toString() {
    return 'DrawArrowsState(arrowModelList: $arrowModelList, updateAStarPath: $updateAStarPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DrawArrowState &&
            const DeepCollectionEquality()
                .equals(other.arrowModelList, arrowModelList) &&
            const DeepCollectionEquality()
                .equals(other.updateAStarPath, updateAStarPath));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(arrowModelList),
      const DeepCollectionEquality().hash(updateAStarPath));

  @JsonKey(ignore: true)
  @override
  _$DrawArrowStateCopyWith<_DrawArrowState> get copyWith =>
      __$DrawArrowStateCopyWithImpl<_DrawArrowState>(this, _$identity);
}

abstract class _DrawArrowState implements DrawArrowsState {
  const factory _DrawArrowState(
      {List<ArrowModel>? arrowModelList,
      bool updateAStarPath}) = _$_DrawArrowState;

  @override
  List<ArrowModel>? get arrowModelList;
  @override
  bool get updateAStarPath;
  @override
  @JsonKey(ignore: true)
  _$DrawArrowStateCopyWith<_DrawArrowState> get copyWith =>
      throw _privateConstructorUsedError;
}