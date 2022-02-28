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

  _DrawArrowState call({ArrowModel? arrowModel}) {
    return _DrawArrowState(
      arrowModel: arrowModel,
    );
  }

  _RemoveArrowState remove({required Key arrowKey}) {
    return _RemoveArrowState(
      arrowKey: arrowKey,
    );
  }
}

/// @nodoc
const $DrawArrowsState = _$DrawArrowsStateTearOff();

/// @nodoc
mixin _$DrawArrowsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ArrowModel? arrowModel) $default, {
    required TResult Function(Key arrowKey) remove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(ArrowModel? arrowModel)? $default, {
    TResult Function(Key arrowKey)? remove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ArrowModel? arrowModel)? $default, {
    TResult Function(Key arrowKey)? remove,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DrawArrowState value) $default, {
    required TResult Function(_RemoveArrowState value) remove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_DrawArrowState value)? $default, {
    TResult Function(_RemoveArrowState value)? remove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DrawArrowState value)? $default, {
    TResult Function(_RemoveArrowState value)? remove,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawArrowsStateCopyWith<$Res> {
  factory $DrawArrowsStateCopyWith(
          DrawArrowsState value, $Res Function(DrawArrowsState) then) =
      _$DrawArrowsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DrawArrowsStateCopyWithImpl<$Res>
    implements $DrawArrowsStateCopyWith<$Res> {
  _$DrawArrowsStateCopyWithImpl(this._value, this._then);

  final DrawArrowsState _value;
  // ignore: unused_field
  final $Res Function(DrawArrowsState) _then;
}

/// @nodoc
abstract class _$DrawArrowStateCopyWith<$Res> {
  factory _$DrawArrowStateCopyWith(
          _DrawArrowState value, $Res Function(_DrawArrowState) then) =
      __$DrawArrowStateCopyWithImpl<$Res>;
  $Res call({ArrowModel? arrowModel});

  $ArrowModelCopyWith<$Res>? get arrowModel;
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
    Object? arrowModel = freezed,
  }) {
    return _then(_DrawArrowState(
      arrowModel: arrowModel == freezed
          ? _value.arrowModel
          : arrowModel // ignore: cast_nullable_to_non_nullable
              as ArrowModel?,
    ));
  }

  @override
  $ArrowModelCopyWith<$Res>? get arrowModel {
    if (_value.arrowModel == null) {
      return null;
    }

    return $ArrowModelCopyWith<$Res>(_value.arrowModel!, (value) {
      return _then(_value.copyWith(arrowModel: value));
    });
  }
}

/// @nodoc

class _$_DrawArrowState implements _DrawArrowState {
  const _$_DrawArrowState({this.arrowModel});

  @override
  final ArrowModel? arrowModel;

  @override
  String toString() {
    return 'DrawArrowsState(arrowModel: $arrowModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DrawArrowState &&
            const DeepCollectionEquality()
                .equals(other.arrowModel, arrowModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(arrowModel));

  @JsonKey(ignore: true)
  @override
  _$DrawArrowStateCopyWith<_DrawArrowState> get copyWith =>
      __$DrawArrowStateCopyWithImpl<_DrawArrowState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ArrowModel? arrowModel) $default, {
    required TResult Function(Key arrowKey) remove,
  }) {
    return $default(arrowModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(ArrowModel? arrowModel)? $default, {
    TResult Function(Key arrowKey)? remove,
  }) {
    return $default?.call(arrowModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ArrowModel? arrowModel)? $default, {
    TResult Function(Key arrowKey)? remove,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(arrowModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DrawArrowState value) $default, {
    required TResult Function(_RemoveArrowState value) remove,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_DrawArrowState value)? $default, {
    TResult Function(_RemoveArrowState value)? remove,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DrawArrowState value)? $default, {
    TResult Function(_RemoveArrowState value)? remove,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _DrawArrowState implements DrawArrowsState {
  const factory _DrawArrowState({ArrowModel? arrowModel}) = _$_DrawArrowState;

  ArrowModel? get arrowModel;
  @JsonKey(ignore: true)
  _$DrawArrowStateCopyWith<_DrawArrowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RemoveArrowStateCopyWith<$Res> {
  factory _$RemoveArrowStateCopyWith(
          _RemoveArrowState value, $Res Function(_RemoveArrowState) then) =
      __$RemoveArrowStateCopyWithImpl<$Res>;
  $Res call({Key arrowKey});
}

/// @nodoc
class __$RemoveArrowStateCopyWithImpl<$Res>
    extends _$DrawArrowsStateCopyWithImpl<$Res>
    implements _$RemoveArrowStateCopyWith<$Res> {
  __$RemoveArrowStateCopyWithImpl(
      _RemoveArrowState _value, $Res Function(_RemoveArrowState) _then)
      : super(_value, (v) => _then(v as _RemoveArrowState));

  @override
  _RemoveArrowState get _value => super._value as _RemoveArrowState;

  @override
  $Res call({
    Object? arrowKey = freezed,
  }) {
    return _then(_RemoveArrowState(
      arrowKey: arrowKey == freezed
          ? _value.arrowKey
          : arrowKey // ignore: cast_nullable_to_non_nullable
              as Key,
    ));
  }
}

/// @nodoc

class _$_RemoveArrowState implements _RemoveArrowState {
  const _$_RemoveArrowState({required this.arrowKey});

  @override
  final Key arrowKey;

  @override
  String toString() {
    return 'DrawArrowsState.remove(arrowKey: $arrowKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemoveArrowState &&
            const DeepCollectionEquality().equals(other.arrowKey, arrowKey));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(arrowKey));

  @JsonKey(ignore: true)
  @override
  _$RemoveArrowStateCopyWith<_RemoveArrowState> get copyWith =>
      __$RemoveArrowStateCopyWithImpl<_RemoveArrowState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ArrowModel? arrowModel) $default, {
    required TResult Function(Key arrowKey) remove,
  }) {
    return remove(arrowKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(ArrowModel? arrowModel)? $default, {
    TResult Function(Key arrowKey)? remove,
  }) {
    return remove?.call(arrowKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ArrowModel? arrowModel)? $default, {
    TResult Function(Key arrowKey)? remove,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(arrowKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DrawArrowState value) $default, {
    required TResult Function(_RemoveArrowState value) remove,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_DrawArrowState value)? $default, {
    TResult Function(_RemoveArrowState value)? remove,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DrawArrowState value)? $default, {
    TResult Function(_RemoveArrowState value)? remove,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _RemoveArrowState implements DrawArrowsState {
  const factory _RemoveArrowState({required Key arrowKey}) =
      _$_RemoveArrowState;

  Key get arrowKey;
  @JsonKey(ignore: true)
  _$RemoveArrowStateCopyWith<_RemoveArrowState> get copyWith =>
      throw _privateConstructorUsedError;
}
