// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'arrow_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArrowModel _$ArrowModelFromJson(Map<String, dynamic> json) {
  return _ArrowModel.fromJson(json);
}

/// @nodoc
class _$ArrowModelTearOff {
  const _$ArrowModelTearOff();

  _ArrowModel call(
      {@JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          required Offset startPoint,
      @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
          required Key startPointKey,
      @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          required Offset endPoint,
      @JsonKey(toJson: keyToJson, fromJson: keyFromJson)
          Key? endPointKey,
      @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
          required Key arrowKey,
      @JsonKey(toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
          AbstractFlowElement? startElement,
      @JsonKey(toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
          AbstractFlowElement? endElement,
      bool? updateAStarPath = false,
      @JsonKey(toJson: offsetListToJson, fromJson: offsetListFromJson)
          List<Offset>? currentArrowPath}) {
    return _ArrowModel(
      startPoint: startPoint,
      startPointKey: startPointKey,
      endPoint: endPoint,
      endPointKey: endPointKey,
      arrowKey: arrowKey,
      startElement: startElement,
      endElement: endElement,
      updateAStarPath: updateAStarPath,
      currentArrowPath: currentArrowPath,
    );
  }

  ArrowModel fromJson(Map<String, Object?> json) {
    return ArrowModel.fromJson(json);
  }
}

/// @nodoc
const $ArrowModel = _$ArrowModelTearOff();

/// @nodoc
mixin _$ArrowModel {
  @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
  Offset get startPoint => throw _privateConstructorUsedError;
  @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
  Key get startPointKey => throw _privateConstructorUsedError;
  @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
  Offset get endPoint => throw _privateConstructorUsedError;
  @JsonKey(toJson: keyToJson, fromJson: keyFromJson)
  Key? get endPointKey => throw _privateConstructorUsedError;
  @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
  Key get arrowKey => throw _privateConstructorUsedError;
  @JsonKey(
      toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
  AbstractFlowElement? get startElement => throw _privateConstructorUsedError;
  @JsonKey(
      toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
  AbstractFlowElement? get endElement => throw _privateConstructorUsedError;
  bool? get updateAStarPath => throw _privateConstructorUsedError;
  @JsonKey(toJson: offsetListToJson, fromJson: offsetListFromJson)
  List<Offset>? get currentArrowPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArrowModelCopyWith<ArrowModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArrowModelCopyWith<$Res> {
  factory $ArrowModelCopyWith(
          ArrowModel value, $Res Function(ArrowModel) then) =
      _$ArrowModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          Offset startPoint,
      @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
          Key startPointKey,
      @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          Offset endPoint,
      @JsonKey(toJson: keyToJson, fromJson: keyFromJson)
          Key? endPointKey,
      @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
          Key arrowKey,
      @JsonKey(toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
          AbstractFlowElement? startElement,
      @JsonKey(toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
          AbstractFlowElement? endElement,
      bool? updateAStarPath,
      @JsonKey(toJson: offsetListToJson, fromJson: offsetListFromJson)
          List<Offset>? currentArrowPath});
}

/// @nodoc
class _$ArrowModelCopyWithImpl<$Res> implements $ArrowModelCopyWith<$Res> {
  _$ArrowModelCopyWithImpl(this._value, this._then);

  final ArrowModel _value;
  // ignore: unused_field
  final $Res Function(ArrowModel) _then;

  @override
  $Res call({
    Object? startPoint = freezed,
    Object? startPointKey = freezed,
    Object? endPoint = freezed,
    Object? endPointKey = freezed,
    Object? arrowKey = freezed,
    Object? startElement = freezed,
    Object? endElement = freezed,
    Object? updateAStarPath = freezed,
    Object? currentArrowPath = freezed,
  }) {
    return _then(_value.copyWith(
      startPoint: startPoint == freezed
          ? _value.startPoint
          : startPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
      startPointKey: startPointKey == freezed
          ? _value.startPointKey
          : startPointKey // ignore: cast_nullable_to_non_nullable
              as Key,
      endPoint: endPoint == freezed
          ? _value.endPoint
          : endPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
      endPointKey: endPointKey == freezed
          ? _value.endPointKey
          : endPointKey // ignore: cast_nullable_to_non_nullable
              as Key?,
      arrowKey: arrowKey == freezed
          ? _value.arrowKey
          : arrowKey // ignore: cast_nullable_to_non_nullable
              as Key,
      startElement: startElement == freezed
          ? _value.startElement
          : startElement // ignore: cast_nullable_to_non_nullable
              as AbstractFlowElement?,
      endElement: endElement == freezed
          ? _value.endElement
          : endElement // ignore: cast_nullable_to_non_nullable
              as AbstractFlowElement?,
      updateAStarPath: updateAStarPath == freezed
          ? _value.updateAStarPath
          : updateAStarPath // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentArrowPath: currentArrowPath == freezed
          ? _value.currentArrowPath
          : currentArrowPath // ignore: cast_nullable_to_non_nullable
              as List<Offset>?,
    ));
  }
}

/// @nodoc
abstract class _$ArrowModelCopyWith<$Res> implements $ArrowModelCopyWith<$Res> {
  factory _$ArrowModelCopyWith(
          _ArrowModel value, $Res Function(_ArrowModel) then) =
      __$ArrowModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          Offset startPoint,
      @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
          Key startPointKey,
      @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          Offset endPoint,
      @JsonKey(toJson: keyToJson, fromJson: keyFromJson)
          Key? endPointKey,
      @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
          Key arrowKey,
      @JsonKey(toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
          AbstractFlowElement? startElement,
      @JsonKey(toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
          AbstractFlowElement? endElement,
      bool? updateAStarPath,
      @JsonKey(toJson: offsetListToJson, fromJson: offsetListFromJson)
          List<Offset>? currentArrowPath});
}

/// @nodoc
class __$ArrowModelCopyWithImpl<$Res> extends _$ArrowModelCopyWithImpl<$Res>
    implements _$ArrowModelCopyWith<$Res> {
  __$ArrowModelCopyWithImpl(
      _ArrowModel _value, $Res Function(_ArrowModel) _then)
      : super(_value, (v) => _then(v as _ArrowModel));

  @override
  _ArrowModel get _value => super._value as _ArrowModel;

  @override
  $Res call({
    Object? startPoint = freezed,
    Object? startPointKey = freezed,
    Object? endPoint = freezed,
    Object? endPointKey = freezed,
    Object? arrowKey = freezed,
    Object? startElement = freezed,
    Object? endElement = freezed,
    Object? updateAStarPath = freezed,
    Object? currentArrowPath = freezed,
  }) {
    return _then(_ArrowModel(
      startPoint: startPoint == freezed
          ? _value.startPoint
          : startPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
      startPointKey: startPointKey == freezed
          ? _value.startPointKey
          : startPointKey // ignore: cast_nullable_to_non_nullable
              as Key,
      endPoint: endPoint == freezed
          ? _value.endPoint
          : endPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
      endPointKey: endPointKey == freezed
          ? _value.endPointKey
          : endPointKey // ignore: cast_nullable_to_non_nullable
              as Key?,
      arrowKey: arrowKey == freezed
          ? _value.arrowKey
          : arrowKey // ignore: cast_nullable_to_non_nullable
              as Key,
      startElement: startElement == freezed
          ? _value.startElement
          : startElement // ignore: cast_nullable_to_non_nullable
              as AbstractFlowElement?,
      endElement: endElement == freezed
          ? _value.endElement
          : endElement // ignore: cast_nullable_to_non_nullable
              as AbstractFlowElement?,
      updateAStarPath: updateAStarPath == freezed
          ? _value.updateAStarPath
          : updateAStarPath // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentArrowPath: currentArrowPath == freezed
          ? _value.currentArrowPath
          : currentArrowPath // ignore: cast_nullable_to_non_nullable
              as List<Offset>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_ArrowModel with DiagnosticableTreeMixin implements _ArrowModel {
  const _$_ArrowModel(
      {@JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          required this.startPoint,
      @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
          required this.startPointKey,
      @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          required this.endPoint,
      @JsonKey(toJson: keyToJson, fromJson: keyFromJson)
          this.endPointKey,
      @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
          required this.arrowKey,
      @JsonKey(toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
          this.startElement,
      @JsonKey(toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
          this.endElement,
      this.updateAStarPath = false,
      @JsonKey(toJson: offsetListToJson, fromJson: offsetListFromJson)
          this.currentArrowPath});

  factory _$_ArrowModel.fromJson(Map<String, dynamic> json) =>
      _$$_ArrowModelFromJson(json);

  @override
  @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
  final Offset startPoint;
  @override
  @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
  final Key startPointKey;
  @override
  @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
  final Offset endPoint;
  @override
  @JsonKey(toJson: keyToJson, fromJson: keyFromJson)
  final Key? endPointKey;
  @override
  @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
  final Key arrowKey;
  @override
  @JsonKey(
      toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
  final AbstractFlowElement? startElement;
  @override
  @JsonKey(
      toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
  final AbstractFlowElement? endElement;
  @JsonKey()
  @override
  final bool? updateAStarPath;
  @override
  @JsonKey(toJson: offsetListToJson, fromJson: offsetListFromJson)
  final List<Offset>? currentArrowPath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArrowModel(startPoint: $startPoint, startPointKey: $startPointKey, endPoint: $endPoint, endPointKey: $endPointKey, arrowKey: $arrowKey, startElement: $startElement, endElement: $endElement, updateAStarPath: $updateAStarPath, currentArrowPath: $currentArrowPath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArrowModel'))
      ..add(DiagnosticsProperty('startPoint', startPoint))
      ..add(DiagnosticsProperty('startPointKey', startPointKey))
      ..add(DiagnosticsProperty('endPoint', endPoint))
      ..add(DiagnosticsProperty('endPointKey', endPointKey))
      ..add(DiagnosticsProperty('arrowKey', arrowKey))
      ..add(DiagnosticsProperty('startElement', startElement))
      ..add(DiagnosticsProperty('endElement', endElement))
      ..add(DiagnosticsProperty('updateAStarPath', updateAStarPath))
      ..add(DiagnosticsProperty('currentArrowPath', currentArrowPath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ArrowModel &&
            const DeepCollectionEquality()
                .equals(other.startPoint, startPoint) &&
            const DeepCollectionEquality()
                .equals(other.startPointKey, startPointKey) &&
            const DeepCollectionEquality().equals(other.endPoint, endPoint) &&
            const DeepCollectionEquality()
                .equals(other.endPointKey, endPointKey) &&
            const DeepCollectionEquality().equals(other.arrowKey, arrowKey) &&
            const DeepCollectionEquality()
                .equals(other.startElement, startElement) &&
            const DeepCollectionEquality()
                .equals(other.endElement, endElement) &&
            const DeepCollectionEquality()
                .equals(other.updateAStarPath, updateAStarPath) &&
            const DeepCollectionEquality()
                .equals(other.currentArrowPath, currentArrowPath));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(startPoint),
      const DeepCollectionEquality().hash(startPointKey),
      const DeepCollectionEquality().hash(endPoint),
      const DeepCollectionEquality().hash(endPointKey),
      const DeepCollectionEquality().hash(arrowKey),
      const DeepCollectionEquality().hash(startElement),
      const DeepCollectionEquality().hash(endElement),
      const DeepCollectionEquality().hash(updateAStarPath),
      const DeepCollectionEquality().hash(currentArrowPath));

  @JsonKey(ignore: true)
  @override
  _$ArrowModelCopyWith<_ArrowModel> get copyWith =>
      __$ArrowModelCopyWithImpl<_ArrowModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArrowModelToJson(this);
  }
}

abstract class _ArrowModel implements ArrowModel {
  const factory _ArrowModel(
      {@JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          required Offset startPoint,
      @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
          required Key startPointKey,
      @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
          required Offset endPoint,
      @JsonKey(toJson: keyToJson, fromJson: keyFromJson)
          Key? endPointKey,
      @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
          required Key arrowKey,
      @JsonKey(toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
          AbstractFlowElement? startElement,
      @JsonKey(toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
          AbstractFlowElement? endElement,
      bool? updateAStarPath,
      @JsonKey(toJson: offsetListToJson, fromJson: offsetListFromJson)
          List<Offset>? currentArrowPath}) = _$_ArrowModel;

  factory _ArrowModel.fromJson(Map<String, dynamic> json) =
      _$_ArrowModel.fromJson;

  @override
  @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
  Offset get startPoint;
  @override
  @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
  Key get startPointKey;
  @override
  @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
  Offset get endPoint;
  @override
  @JsonKey(toJson: keyToJson, fromJson: keyFromJson)
  Key? get endPointKey;
  @override
  @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
  Key get arrowKey;
  @override
  @JsonKey(
      toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
  AbstractFlowElement? get startElement;
  @override
  @JsonKey(
      toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
  AbstractFlowElement? get endElement;
  @override
  bool? get updateAStarPath;
  @override
  @JsonKey(toJson: offsetListToJson, fromJson: offsetListFromJson)
  List<Offset>? get currentArrowPath;
  @override
  @JsonKey(ignore: true)
  _$ArrowModelCopyWith<_ArrowModel> get copyWith =>
      throw _privateConstructorUsedError;
}
