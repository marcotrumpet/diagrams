// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rectangle_flow_element.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RectangleFlowElementTearOff {
  const _$RectangleFlowElementTearOff();

  _RectangleFlowElement call(
      {required FlowTypes flowType, Offset? offset, Key? elementKey}) {
    return _RectangleFlowElement(
      flowType: flowType,
      offset: offset,
      elementKey: elementKey,
    );
  }
}

/// @nodoc
const $RectangleFlowElement = _$RectangleFlowElementTearOff();

/// @nodoc
mixin _$RectangleFlowElement {
  FlowTypes get flowType => throw _privateConstructorUsedError;
  Offset? get offset => throw _privateConstructorUsedError;
  Key? get elementKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RectangleFlowElementCopyWith<RectangleFlowElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RectangleFlowElementCopyWith<$Res> {
  factory $RectangleFlowElementCopyWith(RectangleFlowElement value,
          $Res Function(RectangleFlowElement) then) =
      _$RectangleFlowElementCopyWithImpl<$Res>;
  $Res call({FlowTypes flowType, Offset? offset, Key? elementKey});
}

/// @nodoc
class _$RectangleFlowElementCopyWithImpl<$Res>
    implements $RectangleFlowElementCopyWith<$Res> {
  _$RectangleFlowElementCopyWithImpl(this._value, this._then);

  final RectangleFlowElement _value;
  // ignore: unused_field
  final $Res Function(RectangleFlowElement) _then;

  @override
  $Res call({
    Object? flowType = freezed,
    Object? offset = freezed,
    Object? elementKey = freezed,
  }) {
    return _then(_value.copyWith(
      flowType: flowType == freezed
          ? _value.flowType
          : flowType // ignore: cast_nullable_to_non_nullable
              as FlowTypes,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as Offset?,
      elementKey: elementKey == freezed
          ? _value.elementKey
          : elementKey // ignore: cast_nullable_to_non_nullable
              as Key?,
    ));
  }
}

/// @nodoc
abstract class _$RectangleFlowElementCopyWith<$Res>
    implements $RectangleFlowElementCopyWith<$Res> {
  factory _$RectangleFlowElementCopyWith(_RectangleFlowElement value,
          $Res Function(_RectangleFlowElement) then) =
      __$RectangleFlowElementCopyWithImpl<$Res>;
  @override
  $Res call({FlowTypes flowType, Offset? offset, Key? elementKey});
}

/// @nodoc
class __$RectangleFlowElementCopyWithImpl<$Res>
    extends _$RectangleFlowElementCopyWithImpl<$Res>
    implements _$RectangleFlowElementCopyWith<$Res> {
  __$RectangleFlowElementCopyWithImpl(
      _RectangleFlowElement _value, $Res Function(_RectangleFlowElement) _then)
      : super(_value, (v) => _then(v as _RectangleFlowElement));

  @override
  _RectangleFlowElement get _value => super._value as _RectangleFlowElement;

  @override
  $Res call({
    Object? flowType = freezed,
    Object? offset = freezed,
    Object? elementKey = freezed,
  }) {
    return _then(_RectangleFlowElement(
      flowType: flowType == freezed
          ? _value.flowType
          : flowType // ignore: cast_nullable_to_non_nullable
              as FlowTypes,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as Offset?,
      elementKey: elementKey == freezed
          ? _value.elementKey
          : elementKey // ignore: cast_nullable_to_non_nullable
              as Key?,
    ));
  }
}

/// @nodoc

class _$_RectangleFlowElement extends _RectangleFlowElement {
  const _$_RectangleFlowElement(
      {required this.flowType, this.offset, this.elementKey})
      : super._();

  @override
  final FlowTypes flowType;
  @override
  final Offset? offset;
  @override
  final Key? elementKey;

  @override
  String toString() {
    return 'RectangleFlowElement(flowType: $flowType, offset: $offset, elementKey: $elementKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RectangleFlowElement &&
            const DeepCollectionEquality().equals(other.flowType, flowType) &&
            const DeepCollectionEquality().equals(other.offset, offset) &&
            const DeepCollectionEquality()
                .equals(other.elementKey, elementKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(flowType),
      const DeepCollectionEquality().hash(offset),
      const DeepCollectionEquality().hash(elementKey));

  @JsonKey(ignore: true)
  @override
  _$RectangleFlowElementCopyWith<_RectangleFlowElement> get copyWith =>
      __$RectangleFlowElementCopyWithImpl<_RectangleFlowElement>(
          this, _$identity);
}

abstract class _RectangleFlowElement extends RectangleFlowElement {
  const factory _RectangleFlowElement(
      {required FlowTypes flowType,
      Offset? offset,
      Key? elementKey}) = _$_RectangleFlowElement;
  const _RectangleFlowElement._() : super._();

  @override
  FlowTypes get flowType;
  @override
  Offset? get offset;
  @override
  Key? get elementKey;
  @override
  @JsonKey(ignore: true)
  _$RectangleFlowElementCopyWith<_RectangleFlowElement> get copyWith =>
      throw _privateConstructorUsedError;
}
