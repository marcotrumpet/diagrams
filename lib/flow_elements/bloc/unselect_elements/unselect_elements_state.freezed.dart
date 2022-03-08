// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unselect_elements_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UnselectElementsStateTearOff {
  const _$UnselectElementsStateTearOff();

  _UnselectElementsState call({required bool unselect, Key? elementKey}) {
    return _UnselectElementsState(
      unselect: unselect,
      elementKey: elementKey,
    );
  }
}

/// @nodoc
const $UnselectElementsState = _$UnselectElementsStateTearOff();

/// @nodoc
mixin _$UnselectElementsState {
  bool get unselect => throw _privateConstructorUsedError;
  Key? get elementKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnselectElementsStateCopyWith<UnselectElementsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnselectElementsStateCopyWith<$Res> {
  factory $UnselectElementsStateCopyWith(UnselectElementsState value,
          $Res Function(UnselectElementsState) then) =
      _$UnselectElementsStateCopyWithImpl<$Res>;
  $Res call({bool unselect, Key? elementKey});
}

/// @nodoc
class _$UnselectElementsStateCopyWithImpl<$Res>
    implements $UnselectElementsStateCopyWith<$Res> {
  _$UnselectElementsStateCopyWithImpl(this._value, this._then);

  final UnselectElementsState _value;
  // ignore: unused_field
  final $Res Function(UnselectElementsState) _then;

  @override
  $Res call({
    Object? unselect = freezed,
    Object? elementKey = freezed,
  }) {
    return _then(_value.copyWith(
      unselect: unselect == freezed
          ? _value.unselect
          : unselect // ignore: cast_nullable_to_non_nullable
              as bool,
      elementKey: elementKey == freezed
          ? _value.elementKey
          : elementKey // ignore: cast_nullable_to_non_nullable
              as Key?,
    ));
  }
}

/// @nodoc
abstract class _$UnselectElementsStateCopyWith<$Res>
    implements $UnselectElementsStateCopyWith<$Res> {
  factory _$UnselectElementsStateCopyWith(_UnselectElementsState value,
          $Res Function(_UnselectElementsState) then) =
      __$UnselectElementsStateCopyWithImpl<$Res>;
  @override
  $Res call({bool unselect, Key? elementKey});
}

/// @nodoc
class __$UnselectElementsStateCopyWithImpl<$Res>
    extends _$UnselectElementsStateCopyWithImpl<$Res>
    implements _$UnselectElementsStateCopyWith<$Res> {
  __$UnselectElementsStateCopyWithImpl(_UnselectElementsState _value,
      $Res Function(_UnselectElementsState) _then)
      : super(_value, (v) => _then(v as _UnselectElementsState));

  @override
  _UnselectElementsState get _value => super._value as _UnselectElementsState;

  @override
  $Res call({
    Object? unselect = freezed,
    Object? elementKey = freezed,
  }) {
    return _then(_UnselectElementsState(
      unselect: unselect == freezed
          ? _value.unselect
          : unselect // ignore: cast_nullable_to_non_nullable
              as bool,
      elementKey: elementKey == freezed
          ? _value.elementKey
          : elementKey // ignore: cast_nullable_to_non_nullable
              as Key?,
    ));
  }
}

/// @nodoc

class _$_UnselectElementsState
    with DiagnosticableTreeMixin
    implements _UnselectElementsState {
  const _$_UnselectElementsState({required this.unselect, this.elementKey});

  @override
  final bool unselect;
  @override
  final Key? elementKey;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnselectElementsState(unselect: $unselect, elementKey: $elementKey)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnselectElementsState'))
      ..add(DiagnosticsProperty('unselect', unselect))
      ..add(DiagnosticsProperty('elementKey', elementKey));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnselectElementsState &&
            const DeepCollectionEquality().equals(other.unselect, unselect) &&
            const DeepCollectionEquality()
                .equals(other.elementKey, elementKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(unselect),
      const DeepCollectionEquality().hash(elementKey));

  @JsonKey(ignore: true)
  @override
  _$UnselectElementsStateCopyWith<_UnselectElementsState> get copyWith =>
      __$UnselectElementsStateCopyWithImpl<_UnselectElementsState>(
          this, _$identity);
}

abstract class _UnselectElementsState implements UnselectElementsState {
  const factory _UnselectElementsState(
      {required bool unselect, Key? elementKey}) = _$_UnselectElementsState;

  @override
  bool get unselect;
  @override
  Key? get elementKey;
  @override
  @JsonKey(ignore: true)
  _$UnselectElementsStateCopyWith<_UnselectElementsState> get copyWith =>
      throw _privateConstructorUsedError;
}
