// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'resize_element_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResizeElementEventTearOff {
  const _$ResizeElementEventTearOff();

  _Resize resize(
      {required AbstractFlowElement element, required Offset offset}) {
    return _Resize(
      element: element,
      offset: offset,
    );
  }

  _ClearMap clearMap({required Key elementKey}) {
    return _ClearMap(
      elementKey: elementKey,
    );
  }
}

/// @nodoc
const $ResizeElementEvent = _$ResizeElementEventTearOff();

/// @nodoc
mixin _$ResizeElementEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AbstractFlowElement element, Offset offset)
        resize,
    required TResult Function(Key elementKey) clearMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AbstractFlowElement element, Offset offset)? resize,
    TResult Function(Key elementKey)? clearMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AbstractFlowElement element, Offset offset)? resize,
    TResult Function(Key elementKey)? clearMap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Resize value) resize,
    required TResult Function(_ClearMap value) clearMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Resize value)? resize,
    TResult Function(_ClearMap value)? clearMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Resize value)? resize,
    TResult Function(_ClearMap value)? clearMap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResizeElementEventCopyWith<$Res> {
  factory $ResizeElementEventCopyWith(
          ResizeElementEvent value, $Res Function(ResizeElementEvent) then) =
      _$ResizeElementEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ResizeElementEventCopyWithImpl<$Res>
    implements $ResizeElementEventCopyWith<$Res> {
  _$ResizeElementEventCopyWithImpl(this._value, this._then);

  final ResizeElementEvent _value;
  // ignore: unused_field
  final $Res Function(ResizeElementEvent) _then;
}

/// @nodoc
abstract class _$ResizeCopyWith<$Res> {
  factory _$ResizeCopyWith(_Resize value, $Res Function(_Resize) then) =
      __$ResizeCopyWithImpl<$Res>;
  $Res call({AbstractFlowElement element, Offset offset});
}

/// @nodoc
class __$ResizeCopyWithImpl<$Res> extends _$ResizeElementEventCopyWithImpl<$Res>
    implements _$ResizeCopyWith<$Res> {
  __$ResizeCopyWithImpl(_Resize _value, $Res Function(_Resize) _then)
      : super(_value, (v) => _then(v as _Resize));

  @override
  _Resize get _value => super._value as _Resize;

  @override
  $Res call({
    Object? element = freezed,
    Object? offset = freezed,
  }) {
    return _then(_Resize(
      element: element == freezed
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as AbstractFlowElement,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$_Resize implements _Resize {
  const _$_Resize({required this.element, required this.offset});

  @override
  final AbstractFlowElement element;
  @override
  final Offset offset;

  @override
  String toString() {
    return 'ResizeElementEvent.resize(element: $element, offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Resize &&
            const DeepCollectionEquality().equals(other.element, element) &&
            const DeepCollectionEquality().equals(other.offset, offset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(element),
      const DeepCollectionEquality().hash(offset));

  @JsonKey(ignore: true)
  @override
  _$ResizeCopyWith<_Resize> get copyWith =>
      __$ResizeCopyWithImpl<_Resize>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AbstractFlowElement element, Offset offset)
        resize,
    required TResult Function(Key elementKey) clearMap,
  }) {
    return resize(element, offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AbstractFlowElement element, Offset offset)? resize,
    TResult Function(Key elementKey)? clearMap,
  }) {
    return resize?.call(element, offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AbstractFlowElement element, Offset offset)? resize,
    TResult Function(Key elementKey)? clearMap,
    required TResult orElse(),
  }) {
    if (resize != null) {
      return resize(element, offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Resize value) resize,
    required TResult Function(_ClearMap value) clearMap,
  }) {
    return resize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Resize value)? resize,
    TResult Function(_ClearMap value)? clearMap,
  }) {
    return resize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Resize value)? resize,
    TResult Function(_ClearMap value)? clearMap,
    required TResult orElse(),
  }) {
    if (resize != null) {
      return resize(this);
    }
    return orElse();
  }
}

abstract class _Resize implements ResizeElementEvent {
  const factory _Resize(
      {required AbstractFlowElement element,
      required Offset offset}) = _$_Resize;

  AbstractFlowElement get element;
  Offset get offset;
  @JsonKey(ignore: true)
  _$ResizeCopyWith<_Resize> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ClearMapCopyWith<$Res> {
  factory _$ClearMapCopyWith(_ClearMap value, $Res Function(_ClearMap) then) =
      __$ClearMapCopyWithImpl<$Res>;
  $Res call({Key elementKey});
}

/// @nodoc
class __$ClearMapCopyWithImpl<$Res>
    extends _$ResizeElementEventCopyWithImpl<$Res>
    implements _$ClearMapCopyWith<$Res> {
  __$ClearMapCopyWithImpl(_ClearMap _value, $Res Function(_ClearMap) _then)
      : super(_value, (v) => _then(v as _ClearMap));

  @override
  _ClearMap get _value => super._value as _ClearMap;

  @override
  $Res call({
    Object? elementKey = freezed,
  }) {
    return _then(_ClearMap(
      elementKey: elementKey == freezed
          ? _value.elementKey
          : elementKey // ignore: cast_nullable_to_non_nullable
              as Key,
    ));
  }
}

/// @nodoc

class _$_ClearMap implements _ClearMap {
  const _$_ClearMap({required this.elementKey});

  @override
  final Key elementKey;

  @override
  String toString() {
    return 'ResizeElementEvent.clearMap(elementKey: $elementKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClearMap &&
            const DeepCollectionEquality()
                .equals(other.elementKey, elementKey));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(elementKey));

  @JsonKey(ignore: true)
  @override
  _$ClearMapCopyWith<_ClearMap> get copyWith =>
      __$ClearMapCopyWithImpl<_ClearMap>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AbstractFlowElement element, Offset offset)
        resize,
    required TResult Function(Key elementKey) clearMap,
  }) {
    return clearMap(elementKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AbstractFlowElement element, Offset offset)? resize,
    TResult Function(Key elementKey)? clearMap,
  }) {
    return clearMap?.call(elementKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AbstractFlowElement element, Offset offset)? resize,
    TResult Function(Key elementKey)? clearMap,
    required TResult orElse(),
  }) {
    if (clearMap != null) {
      return clearMap(elementKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Resize value) resize,
    required TResult Function(_ClearMap value) clearMap,
  }) {
    return clearMap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Resize value)? resize,
    TResult Function(_ClearMap value)? clearMap,
  }) {
    return clearMap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Resize value)? resize,
    TResult Function(_ClearMap value)? clearMap,
    required TResult orElse(),
  }) {
    if (clearMap != null) {
      return clearMap(this);
    }
    return orElse();
  }
}

abstract class _ClearMap implements ResizeElementEvent {
  const factory _ClearMap({required Key elementKey}) = _$_ClearMap;

  Key get elementKey;
  @JsonKey(ignore: true)
  _$ClearMapCopyWith<_ClearMap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ResizeElementStateTearOff {
  const _$ResizeElementStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Resized resized({required AbstractFlowElement element}) {
    return _Resized(
      element: element,
    );
  }
}

/// @nodoc
const $ResizeElementState = _$ResizeElementStateTearOff();

/// @nodoc
mixin _$ResizeElementState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AbstractFlowElement element) resized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Resized value) resized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Resized value)? resized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Resized value)? resized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResizeElementStateCopyWith<$Res> {
  factory $ResizeElementStateCopyWith(
          ResizeElementState value, $Res Function(ResizeElementState) then) =
      _$ResizeElementStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ResizeElementStateCopyWithImpl<$Res>
    implements $ResizeElementStateCopyWith<$Res> {
  _$ResizeElementStateCopyWithImpl(this._value, this._then);

  final ResizeElementState _value;
  // ignore: unused_field
  final $Res Function(ResizeElementState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$ResizeElementStateCopyWithImpl<$Res>
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
    return 'ResizeElementState.initial()';
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
    required TResult Function(AbstractFlowElement element) resized,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resized,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resized,
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
    required TResult Function(_Resized value) resized,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Resized value)? resized,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Resized value)? resized,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ResizeElementState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$ResizedCopyWith<$Res> {
  factory _$ResizedCopyWith(_Resized value, $Res Function(_Resized) then) =
      __$ResizedCopyWithImpl<$Res>;
  $Res call({AbstractFlowElement element});
}

/// @nodoc
class __$ResizedCopyWithImpl<$Res>
    extends _$ResizeElementStateCopyWithImpl<$Res>
    implements _$ResizedCopyWith<$Res> {
  __$ResizedCopyWithImpl(_Resized _value, $Res Function(_Resized) _then)
      : super(_value, (v) => _then(v as _Resized));

  @override
  _Resized get _value => super._value as _Resized;

  @override
  $Res call({
    Object? element = freezed,
  }) {
    return _then(_Resized(
      element: element == freezed
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as AbstractFlowElement,
    ));
  }
}

/// @nodoc

class _$_Resized implements _Resized {
  const _$_Resized({required this.element});

  @override
  final AbstractFlowElement element;

  @override
  String toString() {
    return 'ResizeElementState.resized(element: $element)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Resized &&
            const DeepCollectionEquality().equals(other.element, element));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(element));

  @JsonKey(ignore: true)
  @override
  _$ResizedCopyWith<_Resized> get copyWith =>
      __$ResizedCopyWithImpl<_Resized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AbstractFlowElement element) resized,
  }) {
    return resized(element);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resized,
  }) {
    return resized?.call(element);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resized,
    required TResult orElse(),
  }) {
    if (resized != null) {
      return resized(element);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Resized value) resized,
  }) {
    return resized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Resized value)? resized,
  }) {
    return resized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Resized value)? resized,
    required TResult orElse(),
  }) {
    if (resized != null) {
      return resized(this);
    }
    return orElse();
  }
}

abstract class _Resized implements ResizeElementState {
  const factory _Resized({required AbstractFlowElement element}) = _$_Resized;

  AbstractFlowElement get element;
  @JsonKey(ignore: true)
  _$ResizedCopyWith<_Resized> get copyWith =>
      throw _privateConstructorUsedError;
}
