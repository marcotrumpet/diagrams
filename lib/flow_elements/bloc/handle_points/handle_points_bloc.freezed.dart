// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'handle_points_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HandlePointsEventTearOff {
  const _$HandlePointsEventTearOff();

  _PanDown panDown(Offset offset) {
    return _PanDown(
      offset,
    );
  }

  _PanUpdate panUpdate(Offset offset) {
    return _PanUpdate(
      offset,
    );
  }

  _PanEnd panEnd() {
    return const _PanEnd();
  }
}

/// @nodoc
const $HandlePointsEvent = _$HandlePointsEventTearOff();

/// @nodoc
mixin _$HandlePointsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset offset) panDown,
    required TResult Function(Offset offset) panUpdate,
    required TResult Function() panEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Offset offset)? panDown,
    TResult Function(Offset offset)? panUpdate,
    TResult Function()? panEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset offset)? panDown,
    TResult Function(Offset offset)? panUpdate,
    TResult Function()? panEnd,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PanDown value) panDown,
    required TResult Function(_PanUpdate value) panUpdate,
    required TResult Function(_PanEnd value) panEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PanDown value)? panDown,
    TResult Function(_PanUpdate value)? panUpdate,
    TResult Function(_PanEnd value)? panEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PanDown value)? panDown,
    TResult Function(_PanUpdate value)? panUpdate,
    TResult Function(_PanEnd value)? panEnd,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HandlePointsEventCopyWith<$Res> {
  factory $HandlePointsEventCopyWith(
          HandlePointsEvent value, $Res Function(HandlePointsEvent) then) =
      _$HandlePointsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HandlePointsEventCopyWithImpl<$Res>
    implements $HandlePointsEventCopyWith<$Res> {
  _$HandlePointsEventCopyWithImpl(this._value, this._then);

  final HandlePointsEvent _value;
  // ignore: unused_field
  final $Res Function(HandlePointsEvent) _then;
}

/// @nodoc
abstract class _$PanDownCopyWith<$Res> {
  factory _$PanDownCopyWith(_PanDown value, $Res Function(_PanDown) then) =
      __$PanDownCopyWithImpl<$Res>;
  $Res call({Offset offset});
}

/// @nodoc
class __$PanDownCopyWithImpl<$Res> extends _$HandlePointsEventCopyWithImpl<$Res>
    implements _$PanDownCopyWith<$Res> {
  __$PanDownCopyWithImpl(_PanDown _value, $Res Function(_PanDown) _then)
      : super(_value, (v) => _then(v as _PanDown));

  @override
  _PanDown get _value => super._value as _PanDown;

  @override
  $Res call({
    Object? offset = freezed,
  }) {
    return _then(_PanDown(
      offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$_PanDown implements _PanDown {
  const _$_PanDown(this.offset);

  @override
  final Offset offset;

  @override
  String toString() {
    return 'HandlePointsEvent.panDown(offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PanDown &&
            const DeepCollectionEquality().equals(other.offset, offset));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(offset));

  @JsonKey(ignore: true)
  @override
  _$PanDownCopyWith<_PanDown> get copyWith =>
      __$PanDownCopyWithImpl<_PanDown>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset offset) panDown,
    required TResult Function(Offset offset) panUpdate,
    required TResult Function() panEnd,
  }) {
    return panDown(offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Offset offset)? panDown,
    TResult Function(Offset offset)? panUpdate,
    TResult Function()? panEnd,
  }) {
    return panDown?.call(offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset offset)? panDown,
    TResult Function(Offset offset)? panUpdate,
    TResult Function()? panEnd,
    required TResult orElse(),
  }) {
    if (panDown != null) {
      return panDown(offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PanDown value) panDown,
    required TResult Function(_PanUpdate value) panUpdate,
    required TResult Function(_PanEnd value) panEnd,
  }) {
    return panDown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PanDown value)? panDown,
    TResult Function(_PanUpdate value)? panUpdate,
    TResult Function(_PanEnd value)? panEnd,
  }) {
    return panDown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PanDown value)? panDown,
    TResult Function(_PanUpdate value)? panUpdate,
    TResult Function(_PanEnd value)? panEnd,
    required TResult orElse(),
  }) {
    if (panDown != null) {
      return panDown(this);
    }
    return orElse();
  }
}

abstract class _PanDown implements HandlePointsEvent {
  const factory _PanDown(Offset offset) = _$_PanDown;

  Offset get offset;
  @JsonKey(ignore: true)
  _$PanDownCopyWith<_PanDown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PanUpdateCopyWith<$Res> {
  factory _$PanUpdateCopyWith(
          _PanUpdate value, $Res Function(_PanUpdate) then) =
      __$PanUpdateCopyWithImpl<$Res>;
  $Res call({Offset offset});
}

/// @nodoc
class __$PanUpdateCopyWithImpl<$Res>
    extends _$HandlePointsEventCopyWithImpl<$Res>
    implements _$PanUpdateCopyWith<$Res> {
  __$PanUpdateCopyWithImpl(_PanUpdate _value, $Res Function(_PanUpdate) _then)
      : super(_value, (v) => _then(v as _PanUpdate));

  @override
  _PanUpdate get _value => super._value as _PanUpdate;

  @override
  $Res call({
    Object? offset = freezed,
  }) {
    return _then(_PanUpdate(
      offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$_PanUpdate implements _PanUpdate {
  const _$_PanUpdate(this.offset);

  @override
  final Offset offset;

  @override
  String toString() {
    return 'HandlePointsEvent.panUpdate(offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PanUpdate &&
            const DeepCollectionEquality().equals(other.offset, offset));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(offset));

  @JsonKey(ignore: true)
  @override
  _$PanUpdateCopyWith<_PanUpdate> get copyWith =>
      __$PanUpdateCopyWithImpl<_PanUpdate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset offset) panDown,
    required TResult Function(Offset offset) panUpdate,
    required TResult Function() panEnd,
  }) {
    return panUpdate(offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Offset offset)? panDown,
    TResult Function(Offset offset)? panUpdate,
    TResult Function()? panEnd,
  }) {
    return panUpdate?.call(offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset offset)? panDown,
    TResult Function(Offset offset)? panUpdate,
    TResult Function()? panEnd,
    required TResult orElse(),
  }) {
    if (panUpdate != null) {
      return panUpdate(offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PanDown value) panDown,
    required TResult Function(_PanUpdate value) panUpdate,
    required TResult Function(_PanEnd value) panEnd,
  }) {
    return panUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PanDown value)? panDown,
    TResult Function(_PanUpdate value)? panUpdate,
    TResult Function(_PanEnd value)? panEnd,
  }) {
    return panUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PanDown value)? panDown,
    TResult Function(_PanUpdate value)? panUpdate,
    TResult Function(_PanEnd value)? panEnd,
    required TResult orElse(),
  }) {
    if (panUpdate != null) {
      return panUpdate(this);
    }
    return orElse();
  }
}

abstract class _PanUpdate implements HandlePointsEvent {
  const factory _PanUpdate(Offset offset) = _$_PanUpdate;

  Offset get offset;
  @JsonKey(ignore: true)
  _$PanUpdateCopyWith<_PanUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PanEndCopyWith<$Res> {
  factory _$PanEndCopyWith(_PanEnd value, $Res Function(_PanEnd) then) =
      __$PanEndCopyWithImpl<$Res>;
}

/// @nodoc
class __$PanEndCopyWithImpl<$Res> extends _$HandlePointsEventCopyWithImpl<$Res>
    implements _$PanEndCopyWith<$Res> {
  __$PanEndCopyWithImpl(_PanEnd _value, $Res Function(_PanEnd) _then)
      : super(_value, (v) => _then(v as _PanEnd));

  @override
  _PanEnd get _value => super._value as _PanEnd;
}

/// @nodoc

class _$_PanEnd implements _PanEnd {
  const _$_PanEnd();

  @override
  String toString() {
    return 'HandlePointsEvent.panEnd()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PanEnd);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset offset) panDown,
    required TResult Function(Offset offset) panUpdate,
    required TResult Function() panEnd,
  }) {
    return panEnd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Offset offset)? panDown,
    TResult Function(Offset offset)? panUpdate,
    TResult Function()? panEnd,
  }) {
    return panEnd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset offset)? panDown,
    TResult Function(Offset offset)? panUpdate,
    TResult Function()? panEnd,
    required TResult orElse(),
  }) {
    if (panEnd != null) {
      return panEnd();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PanDown value) panDown,
    required TResult Function(_PanUpdate value) panUpdate,
    required TResult Function(_PanEnd value) panEnd,
  }) {
    return panEnd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PanDown value)? panDown,
    TResult Function(_PanUpdate value)? panUpdate,
    TResult Function(_PanEnd value)? panEnd,
  }) {
    return panEnd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PanDown value)? panDown,
    TResult Function(_PanUpdate value)? panUpdate,
    TResult Function(_PanEnd value)? panEnd,
    required TResult orElse(),
  }) {
    if (panEnd != null) {
      return panEnd(this);
    }
    return orElse();
  }
}

abstract class _PanEnd implements HandlePointsEvent {
  const factory _PanEnd() = _$_PanEnd;
}

/// @nodoc
class _$HandlePointsStateTearOff {
  const _$HandlePointsStateTearOff();

  _Initial initial() {
    return const _Initial();
  }
}

/// @nodoc
const $HandlePointsState = _$HandlePointsStateTearOff();

/// @nodoc
mixin _$HandlePointsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HandlePointsStateCopyWith<$Res> {
  factory $HandlePointsStateCopyWith(
          HandlePointsState value, $Res Function(HandlePointsState) then) =
      _$HandlePointsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HandlePointsStateCopyWithImpl<$Res>
    implements $HandlePointsStateCopyWith<$Res> {
  _$HandlePointsStateCopyWithImpl(this._value, this._then);

  final HandlePointsState _value;
  // ignore: unused_field
  final $Res Function(HandlePointsState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$HandlePointsStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'HandlePointsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HandlePointsState {
  const factory _Initial() = _$_Initial;
}
