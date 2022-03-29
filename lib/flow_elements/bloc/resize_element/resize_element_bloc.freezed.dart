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

  _Resizing resizing(
      {required Key elementKey,
      required Offset offset,
      required Alignment alignment}) {
    return _Resizing(
      elementKey: elementKey,
      offset: offset,
      alignment: alignment,
    );
  }

  _ClearMap clearMap({required Key elementKey}) {
    return _ClearMap(
      elementKey: elementKey,
    );
  }

  _ResizeEnd resizeEnd({required Key elementKey}) {
    return _ResizeEnd(
      elementKey: elementKey,
    );
  }
}

/// @nodoc
const $ResizeElementEvent = _$ResizeElementEventTearOff();

/// @nodoc
mixin _$ResizeElementEvent {
  Key get elementKey => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Key elementKey, Offset offset, Alignment alignment)
        resizing,
    required TResult Function(Key elementKey) clearMap,
    required TResult Function(Key elementKey) resizeEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Key elementKey, Offset offset, Alignment alignment)?
        resizing,
    TResult Function(Key elementKey)? clearMap,
    TResult Function(Key elementKey)? resizeEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Key elementKey, Offset offset, Alignment alignment)?
        resizing,
    TResult Function(Key elementKey)? clearMap,
    TResult Function(Key elementKey)? resizeEnd,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Resizing value) resizing,
    required TResult Function(_ClearMap value) clearMap,
    required TResult Function(_ResizeEnd value) resizeEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Resizing value)? resizing,
    TResult Function(_ClearMap value)? clearMap,
    TResult Function(_ResizeEnd value)? resizeEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Resizing value)? resizing,
    TResult Function(_ClearMap value)? clearMap,
    TResult Function(_ResizeEnd value)? resizeEnd,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResizeElementEventCopyWith<ResizeElementEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResizeElementEventCopyWith<$Res> {
  factory $ResizeElementEventCopyWith(
          ResizeElementEvent value, $Res Function(ResizeElementEvent) then) =
      _$ResizeElementEventCopyWithImpl<$Res>;
  $Res call({Key elementKey});
}

/// @nodoc
class _$ResizeElementEventCopyWithImpl<$Res>
    implements $ResizeElementEventCopyWith<$Res> {
  _$ResizeElementEventCopyWithImpl(this._value, this._then);

  final ResizeElementEvent _value;
  // ignore: unused_field
  final $Res Function(ResizeElementEvent) _then;

  @override
  $Res call({
    Object? elementKey = freezed,
  }) {
    return _then(_value.copyWith(
      elementKey: elementKey == freezed
          ? _value.elementKey
          : elementKey // ignore: cast_nullable_to_non_nullable
              as Key,
    ));
  }
}

/// @nodoc
abstract class _$ResizingCopyWith<$Res>
    implements $ResizeElementEventCopyWith<$Res> {
  factory _$ResizingCopyWith(_Resizing value, $Res Function(_Resizing) then) =
      __$ResizingCopyWithImpl<$Res>;
  @override
  $Res call({Key elementKey, Offset offset, Alignment alignment});
}

/// @nodoc
class __$ResizingCopyWithImpl<$Res>
    extends _$ResizeElementEventCopyWithImpl<$Res>
    implements _$ResizingCopyWith<$Res> {
  __$ResizingCopyWithImpl(_Resizing _value, $Res Function(_Resizing) _then)
      : super(_value, (v) => _then(v as _Resizing));

  @override
  _Resizing get _value => super._value as _Resizing;

  @override
  $Res call({
    Object? elementKey = freezed,
    Object? offset = freezed,
    Object? alignment = freezed,
  }) {
    return _then(_Resizing(
      elementKey: elementKey == freezed
          ? _value.elementKey
          : elementKey // ignore: cast_nullable_to_non_nullable
              as Key,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as Offset,
      alignment: alignment == freezed
          ? _value.alignment
          : alignment // ignore: cast_nullable_to_non_nullable
              as Alignment,
    ));
  }
}

/// @nodoc

class _$_Resizing implements _Resizing {
  const _$_Resizing(
      {required this.elementKey,
      required this.offset,
      required this.alignment});

  @override
  final Key elementKey;
  @override
  final Offset offset;
  @override
  final Alignment alignment;

  @override
  String toString() {
    return 'ResizeElementEvent.resizing(elementKey: $elementKey, offset: $offset, alignment: $alignment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Resizing &&
            const DeepCollectionEquality()
                .equals(other.elementKey, elementKey) &&
            const DeepCollectionEquality().equals(other.offset, offset) &&
            const DeepCollectionEquality().equals(other.alignment, alignment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(elementKey),
      const DeepCollectionEquality().hash(offset),
      const DeepCollectionEquality().hash(alignment));

  @JsonKey(ignore: true)
  @override
  _$ResizingCopyWith<_Resizing> get copyWith =>
      __$ResizingCopyWithImpl<_Resizing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Key elementKey, Offset offset, Alignment alignment)
        resizing,
    required TResult Function(Key elementKey) clearMap,
    required TResult Function(Key elementKey) resizeEnd,
  }) {
    return resizing(elementKey, offset, alignment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Key elementKey, Offset offset, Alignment alignment)?
        resizing,
    TResult Function(Key elementKey)? clearMap,
    TResult Function(Key elementKey)? resizeEnd,
  }) {
    return resizing?.call(elementKey, offset, alignment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Key elementKey, Offset offset, Alignment alignment)?
        resizing,
    TResult Function(Key elementKey)? clearMap,
    TResult Function(Key elementKey)? resizeEnd,
    required TResult orElse(),
  }) {
    if (resizing != null) {
      return resizing(elementKey, offset, alignment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Resizing value) resizing,
    required TResult Function(_ClearMap value) clearMap,
    required TResult Function(_ResizeEnd value) resizeEnd,
  }) {
    return resizing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Resizing value)? resizing,
    TResult Function(_ClearMap value)? clearMap,
    TResult Function(_ResizeEnd value)? resizeEnd,
  }) {
    return resizing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Resizing value)? resizing,
    TResult Function(_ClearMap value)? clearMap,
    TResult Function(_ResizeEnd value)? resizeEnd,
    required TResult orElse(),
  }) {
    if (resizing != null) {
      return resizing(this);
    }
    return orElse();
  }
}

abstract class _Resizing implements ResizeElementEvent {
  const factory _Resizing(
      {required Key elementKey,
      required Offset offset,
      required Alignment alignment}) = _$_Resizing;

  @override
  Key get elementKey;
  Offset get offset;
  Alignment get alignment;
  @override
  @JsonKey(ignore: true)
  _$ResizingCopyWith<_Resizing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ClearMapCopyWith<$Res>
    implements $ResizeElementEventCopyWith<$Res> {
  factory _$ClearMapCopyWith(_ClearMap value, $Res Function(_ClearMap) then) =
      __$ClearMapCopyWithImpl<$Res>;
  @override
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
    required TResult Function(
            Key elementKey, Offset offset, Alignment alignment)
        resizing,
    required TResult Function(Key elementKey) clearMap,
    required TResult Function(Key elementKey) resizeEnd,
  }) {
    return clearMap(elementKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Key elementKey, Offset offset, Alignment alignment)?
        resizing,
    TResult Function(Key elementKey)? clearMap,
    TResult Function(Key elementKey)? resizeEnd,
  }) {
    return clearMap?.call(elementKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Key elementKey, Offset offset, Alignment alignment)?
        resizing,
    TResult Function(Key elementKey)? clearMap,
    TResult Function(Key elementKey)? resizeEnd,
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
    required TResult Function(_Resizing value) resizing,
    required TResult Function(_ClearMap value) clearMap,
    required TResult Function(_ResizeEnd value) resizeEnd,
  }) {
    return clearMap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Resizing value)? resizing,
    TResult Function(_ClearMap value)? clearMap,
    TResult Function(_ResizeEnd value)? resizeEnd,
  }) {
    return clearMap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Resizing value)? resizing,
    TResult Function(_ClearMap value)? clearMap,
    TResult Function(_ResizeEnd value)? resizeEnd,
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

  @override
  Key get elementKey;
  @override
  @JsonKey(ignore: true)
  _$ClearMapCopyWith<_ClearMap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ResizeEndCopyWith<$Res>
    implements $ResizeElementEventCopyWith<$Res> {
  factory _$ResizeEndCopyWith(
          _ResizeEnd value, $Res Function(_ResizeEnd) then) =
      __$ResizeEndCopyWithImpl<$Res>;
  @override
  $Res call({Key elementKey});
}

/// @nodoc
class __$ResizeEndCopyWithImpl<$Res>
    extends _$ResizeElementEventCopyWithImpl<$Res>
    implements _$ResizeEndCopyWith<$Res> {
  __$ResizeEndCopyWithImpl(_ResizeEnd _value, $Res Function(_ResizeEnd) _then)
      : super(_value, (v) => _then(v as _ResizeEnd));

  @override
  _ResizeEnd get _value => super._value as _ResizeEnd;

  @override
  $Res call({
    Object? elementKey = freezed,
  }) {
    return _then(_ResizeEnd(
      elementKey: elementKey == freezed
          ? _value.elementKey
          : elementKey // ignore: cast_nullable_to_non_nullable
              as Key,
    ));
  }
}

/// @nodoc

class _$_ResizeEnd implements _ResizeEnd {
  const _$_ResizeEnd({required this.elementKey});

  @override
  final Key elementKey;

  @override
  String toString() {
    return 'ResizeElementEvent.resizeEnd(elementKey: $elementKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResizeEnd &&
            const DeepCollectionEquality()
                .equals(other.elementKey, elementKey));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(elementKey));

  @JsonKey(ignore: true)
  @override
  _$ResizeEndCopyWith<_ResizeEnd> get copyWith =>
      __$ResizeEndCopyWithImpl<_ResizeEnd>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Key elementKey, Offset offset, Alignment alignment)
        resizing,
    required TResult Function(Key elementKey) clearMap,
    required TResult Function(Key elementKey) resizeEnd,
  }) {
    return resizeEnd(elementKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Key elementKey, Offset offset, Alignment alignment)?
        resizing,
    TResult Function(Key elementKey)? clearMap,
    TResult Function(Key elementKey)? resizeEnd,
  }) {
    return resizeEnd?.call(elementKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Key elementKey, Offset offset, Alignment alignment)?
        resizing,
    TResult Function(Key elementKey)? clearMap,
    TResult Function(Key elementKey)? resizeEnd,
    required TResult orElse(),
  }) {
    if (resizeEnd != null) {
      return resizeEnd(elementKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Resizing value) resizing,
    required TResult Function(_ClearMap value) clearMap,
    required TResult Function(_ResizeEnd value) resizeEnd,
  }) {
    return resizeEnd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Resizing value)? resizing,
    TResult Function(_ClearMap value)? clearMap,
    TResult Function(_ResizeEnd value)? resizeEnd,
  }) {
    return resizeEnd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Resizing value)? resizing,
    TResult Function(_ClearMap value)? clearMap,
    TResult Function(_ResizeEnd value)? resizeEnd,
    required TResult orElse(),
  }) {
    if (resizeEnd != null) {
      return resizeEnd(this);
    }
    return orElse();
  }
}

abstract class _ResizeEnd implements ResizeElementEvent {
  const factory _ResizeEnd({required Key elementKey}) = _$_ResizeEnd;

  @override
  Key get elementKey;
  @override
  @JsonKey(ignore: true)
  _$ResizeEndCopyWith<_ResizeEnd> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ResizeElementStateTearOff {
  const _$ResizeElementStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _ResizingState resizing({required AbstractFlowElement element}) {
    return _ResizingState(
      element: element,
    );
  }

  _ResizeEndState resizeEnd({required AbstractFlowElement element}) {
    return _ResizeEndState(
      element: element,
    );
  }

  _ResizeStartState resizeStart() {
    return const _ResizeStartState();
  }
}

/// @nodoc
const $ResizeElementState = _$ResizeElementStateTearOff();

/// @nodoc
mixin _$ResizeElementState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AbstractFlowElement element) resizing,
    required TResult Function(AbstractFlowElement element) resizeEnd,
    required TResult Function() resizeStart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resizing,
    TResult Function(AbstractFlowElement element)? resizeEnd,
    TResult Function()? resizeStart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resizing,
    TResult Function(AbstractFlowElement element)? resizeEnd,
    TResult Function()? resizeStart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ResizingState value) resizing,
    required TResult Function(_ResizeEndState value) resizeEnd,
    required TResult Function(_ResizeStartState value) resizeStart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ResizingState value)? resizing,
    TResult Function(_ResizeEndState value)? resizeEnd,
    TResult Function(_ResizeStartState value)? resizeStart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ResizingState value)? resizing,
    TResult Function(_ResizeEndState value)? resizeEnd,
    TResult Function(_ResizeStartState value)? resizeStart,
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
    required TResult Function(AbstractFlowElement element) resizing,
    required TResult Function(AbstractFlowElement element) resizeEnd,
    required TResult Function() resizeStart,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resizing,
    TResult Function(AbstractFlowElement element)? resizeEnd,
    TResult Function()? resizeStart,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resizing,
    TResult Function(AbstractFlowElement element)? resizeEnd,
    TResult Function()? resizeStart,
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
    required TResult Function(_ResizingState value) resizing,
    required TResult Function(_ResizeEndState value) resizeEnd,
    required TResult Function(_ResizeStartState value) resizeStart,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ResizingState value)? resizing,
    TResult Function(_ResizeEndState value)? resizeEnd,
    TResult Function(_ResizeStartState value)? resizeStart,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ResizingState value)? resizing,
    TResult Function(_ResizeEndState value)? resizeEnd,
    TResult Function(_ResizeStartState value)? resizeStart,
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
abstract class _$ResizingStateCopyWith<$Res> {
  factory _$ResizingStateCopyWith(
          _ResizingState value, $Res Function(_ResizingState) then) =
      __$ResizingStateCopyWithImpl<$Res>;
  $Res call({AbstractFlowElement element});
}

/// @nodoc
class __$ResizingStateCopyWithImpl<$Res>
    extends _$ResizeElementStateCopyWithImpl<$Res>
    implements _$ResizingStateCopyWith<$Res> {
  __$ResizingStateCopyWithImpl(
      _ResizingState _value, $Res Function(_ResizingState) _then)
      : super(_value, (v) => _then(v as _ResizingState));

  @override
  _ResizingState get _value => super._value as _ResizingState;

  @override
  $Res call({
    Object? element = freezed,
  }) {
    return _then(_ResizingState(
      element: element == freezed
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as AbstractFlowElement,
    ));
  }
}

/// @nodoc

class _$_ResizingState implements _ResizingState {
  const _$_ResizingState({required this.element});

  @override
  final AbstractFlowElement element;

  @override
  String toString() {
    return 'ResizeElementState.resizing(element: $element)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResizingState &&
            const DeepCollectionEquality().equals(other.element, element));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(element));

  @JsonKey(ignore: true)
  @override
  _$ResizingStateCopyWith<_ResizingState> get copyWith =>
      __$ResizingStateCopyWithImpl<_ResizingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AbstractFlowElement element) resizing,
    required TResult Function(AbstractFlowElement element) resizeEnd,
    required TResult Function() resizeStart,
  }) {
    return resizing(element);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resizing,
    TResult Function(AbstractFlowElement element)? resizeEnd,
    TResult Function()? resizeStart,
  }) {
    return resizing?.call(element);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resizing,
    TResult Function(AbstractFlowElement element)? resizeEnd,
    TResult Function()? resizeStart,
    required TResult orElse(),
  }) {
    if (resizing != null) {
      return resizing(element);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ResizingState value) resizing,
    required TResult Function(_ResizeEndState value) resizeEnd,
    required TResult Function(_ResizeStartState value) resizeStart,
  }) {
    return resizing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ResizingState value)? resizing,
    TResult Function(_ResizeEndState value)? resizeEnd,
    TResult Function(_ResizeStartState value)? resizeStart,
  }) {
    return resizing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ResizingState value)? resizing,
    TResult Function(_ResizeEndState value)? resizeEnd,
    TResult Function(_ResizeStartState value)? resizeStart,
    required TResult orElse(),
  }) {
    if (resizing != null) {
      return resizing(this);
    }
    return orElse();
  }
}

abstract class _ResizingState implements ResizeElementState {
  const factory _ResizingState({required AbstractFlowElement element}) =
      _$_ResizingState;

  AbstractFlowElement get element;
  @JsonKey(ignore: true)
  _$ResizingStateCopyWith<_ResizingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ResizeEndStateCopyWith<$Res> {
  factory _$ResizeEndStateCopyWith(
          _ResizeEndState value, $Res Function(_ResizeEndState) then) =
      __$ResizeEndStateCopyWithImpl<$Res>;
  $Res call({AbstractFlowElement element});
}

/// @nodoc
class __$ResizeEndStateCopyWithImpl<$Res>
    extends _$ResizeElementStateCopyWithImpl<$Res>
    implements _$ResizeEndStateCopyWith<$Res> {
  __$ResizeEndStateCopyWithImpl(
      _ResizeEndState _value, $Res Function(_ResizeEndState) _then)
      : super(_value, (v) => _then(v as _ResizeEndState));

  @override
  _ResizeEndState get _value => super._value as _ResizeEndState;

  @override
  $Res call({
    Object? element = freezed,
  }) {
    return _then(_ResizeEndState(
      element: element == freezed
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as AbstractFlowElement,
    ));
  }
}

/// @nodoc

class _$_ResizeEndState implements _ResizeEndState {
  const _$_ResizeEndState({required this.element});

  @override
  final AbstractFlowElement element;

  @override
  String toString() {
    return 'ResizeElementState.resizeEnd(element: $element)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResizeEndState &&
            const DeepCollectionEquality().equals(other.element, element));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(element));

  @JsonKey(ignore: true)
  @override
  _$ResizeEndStateCopyWith<_ResizeEndState> get copyWith =>
      __$ResizeEndStateCopyWithImpl<_ResizeEndState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AbstractFlowElement element) resizing,
    required TResult Function(AbstractFlowElement element) resizeEnd,
    required TResult Function() resizeStart,
  }) {
    return resizeEnd(element);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resizing,
    TResult Function(AbstractFlowElement element)? resizeEnd,
    TResult Function()? resizeStart,
  }) {
    return resizeEnd?.call(element);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resizing,
    TResult Function(AbstractFlowElement element)? resizeEnd,
    TResult Function()? resizeStart,
    required TResult orElse(),
  }) {
    if (resizeEnd != null) {
      return resizeEnd(element);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ResizingState value) resizing,
    required TResult Function(_ResizeEndState value) resizeEnd,
    required TResult Function(_ResizeStartState value) resizeStart,
  }) {
    return resizeEnd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ResizingState value)? resizing,
    TResult Function(_ResizeEndState value)? resizeEnd,
    TResult Function(_ResizeStartState value)? resizeStart,
  }) {
    return resizeEnd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ResizingState value)? resizing,
    TResult Function(_ResizeEndState value)? resizeEnd,
    TResult Function(_ResizeStartState value)? resizeStart,
    required TResult orElse(),
  }) {
    if (resizeEnd != null) {
      return resizeEnd(this);
    }
    return orElse();
  }
}

abstract class _ResizeEndState implements ResizeElementState {
  const factory _ResizeEndState({required AbstractFlowElement element}) =
      _$_ResizeEndState;

  AbstractFlowElement get element;
  @JsonKey(ignore: true)
  _$ResizeEndStateCopyWith<_ResizeEndState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ResizeStartStateCopyWith<$Res> {
  factory _$ResizeStartStateCopyWith(
          _ResizeStartState value, $Res Function(_ResizeStartState) then) =
      __$ResizeStartStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$ResizeStartStateCopyWithImpl<$Res>
    extends _$ResizeElementStateCopyWithImpl<$Res>
    implements _$ResizeStartStateCopyWith<$Res> {
  __$ResizeStartStateCopyWithImpl(
      _ResizeStartState _value, $Res Function(_ResizeStartState) _then)
      : super(_value, (v) => _then(v as _ResizeStartState));

  @override
  _ResizeStartState get _value => super._value as _ResizeStartState;
}

/// @nodoc

class _$_ResizeStartState implements _ResizeStartState {
  const _$_ResizeStartState();

  @override
  String toString() {
    return 'ResizeElementState.resizeStart()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ResizeStartState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AbstractFlowElement element) resizing,
    required TResult Function(AbstractFlowElement element) resizeEnd,
    required TResult Function() resizeStart,
  }) {
    return resizeStart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resizing,
    TResult Function(AbstractFlowElement element)? resizeEnd,
    TResult Function()? resizeStart,
  }) {
    return resizeStart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AbstractFlowElement element)? resizing,
    TResult Function(AbstractFlowElement element)? resizeEnd,
    TResult Function()? resizeStart,
    required TResult orElse(),
  }) {
    if (resizeStart != null) {
      return resizeStart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ResizingState value) resizing,
    required TResult Function(_ResizeEndState value) resizeEnd,
    required TResult Function(_ResizeStartState value) resizeStart,
  }) {
    return resizeStart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ResizingState value)? resizing,
    TResult Function(_ResizeEndState value)? resizeEnd,
    TResult Function(_ResizeStartState value)? resizeStart,
  }) {
    return resizeStart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ResizingState value)? resizing,
    TResult Function(_ResizeEndState value)? resizeEnd,
    TResult Function(_ResizeStartState value)? resizeStart,
    required TResult orElse(),
  }) {
    if (resizeStart != null) {
      return resizeStart(this);
    }
    return orElse();
  }
}

abstract class _ResizeStartState implements ResizeElementState {
  const factory _ResizeStartState() = _$_ResizeStartState;
}
