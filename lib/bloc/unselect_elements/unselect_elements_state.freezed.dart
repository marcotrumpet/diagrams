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

  _UnselectElementsState call(
      {required SelectedElementList selectedElementList}) {
    return _UnselectElementsState(
      selectedElementList: selectedElementList,
    );
  }
}

/// @nodoc
const $UnselectElementsState = _$UnselectElementsStateTearOff();

/// @nodoc
mixin _$UnselectElementsState {
  SelectedElementList get selectedElementList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnselectElementsStateCopyWith<UnselectElementsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnselectElementsStateCopyWith<$Res> {
  factory $UnselectElementsStateCopyWith(UnselectElementsState value,
          $Res Function(UnselectElementsState) then) =
      _$UnselectElementsStateCopyWithImpl<$Res>;
  $Res call({SelectedElementList selectedElementList});

  $SelectedElementListCopyWith<$Res> get selectedElementList;
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
    Object? selectedElementList = freezed,
  }) {
    return _then(_value.copyWith(
      selectedElementList: selectedElementList == freezed
          ? _value.selectedElementList
          : selectedElementList // ignore: cast_nullable_to_non_nullable
              as SelectedElementList,
    ));
  }

  @override
  $SelectedElementListCopyWith<$Res> get selectedElementList {
    return $SelectedElementListCopyWith<$Res>(_value.selectedElementList,
        (value) {
      return _then(_value.copyWith(selectedElementList: value));
    });
  }
}

/// @nodoc
abstract class _$UnselectElementsStateCopyWith<$Res>
    implements $UnselectElementsStateCopyWith<$Res> {
  factory _$UnselectElementsStateCopyWith(_UnselectElementsState value,
          $Res Function(_UnselectElementsState) then) =
      __$UnselectElementsStateCopyWithImpl<$Res>;
  @override
  $Res call({SelectedElementList selectedElementList});

  @override
  $SelectedElementListCopyWith<$Res> get selectedElementList;
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
    Object? selectedElementList = freezed,
  }) {
    return _then(_UnselectElementsState(
      selectedElementList: selectedElementList == freezed
          ? _value.selectedElementList
          : selectedElementList // ignore: cast_nullable_to_non_nullable
              as SelectedElementList,
    ));
  }
}

/// @nodoc

class _$_UnselectElementsState
    with DiagnosticableTreeMixin
    implements _UnselectElementsState {
  const _$_UnselectElementsState({required this.selectedElementList});

  @override
  final SelectedElementList selectedElementList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnselectElementsState(selectedElementList: $selectedElementList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnselectElementsState'))
      ..add(DiagnosticsProperty('selectedElementList', selectedElementList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnselectElementsState &&
            const DeepCollectionEquality()
                .equals(other.selectedElementList, selectedElementList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(selectedElementList));

  @JsonKey(ignore: true)
  @override
  _$UnselectElementsStateCopyWith<_UnselectElementsState> get copyWith =>
      __$UnselectElementsStateCopyWithImpl<_UnselectElementsState>(
          this, _$identity);
}

abstract class _UnselectElementsState implements UnselectElementsState {
  const factory _UnselectElementsState(
          {required SelectedElementList selectedElementList}) =
      _$_UnselectElementsState;

  @override
  SelectedElementList get selectedElementList;
  @override
  @JsonKey(ignore: true)
  _$UnselectElementsStateCopyWith<_UnselectElementsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SelectedElementListTearOff {
  const _$SelectedElementListTearOff();

  _SelectedElementList call(
      {List<SelectedElement> selectedElements = const <SelectedElement>[]}) {
    return _SelectedElementList(
      selectedElements: selectedElements,
    );
  }
}

/// @nodoc
const $SelectedElementList = _$SelectedElementListTearOff();

/// @nodoc
mixin _$SelectedElementList {
  List<SelectedElement> get selectedElements =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectedElementListCopyWith<SelectedElementList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedElementListCopyWith<$Res> {
  factory $SelectedElementListCopyWith(
          SelectedElementList value, $Res Function(SelectedElementList) then) =
      _$SelectedElementListCopyWithImpl<$Res>;
  $Res call({List<SelectedElement> selectedElements});
}

/// @nodoc
class _$SelectedElementListCopyWithImpl<$Res>
    implements $SelectedElementListCopyWith<$Res> {
  _$SelectedElementListCopyWithImpl(this._value, this._then);

  final SelectedElementList _value;
  // ignore: unused_field
  final $Res Function(SelectedElementList) _then;

  @override
  $Res call({
    Object? selectedElements = freezed,
  }) {
    return _then(_value.copyWith(
      selectedElements: selectedElements == freezed
          ? _value.selectedElements
          : selectedElements // ignore: cast_nullable_to_non_nullable
              as List<SelectedElement>,
    ));
  }
}

/// @nodoc
abstract class _$SelectedElementListCopyWith<$Res>
    implements $SelectedElementListCopyWith<$Res> {
  factory _$SelectedElementListCopyWith(_SelectedElementList value,
          $Res Function(_SelectedElementList) then) =
      __$SelectedElementListCopyWithImpl<$Res>;
  @override
  $Res call({List<SelectedElement> selectedElements});
}

/// @nodoc
class __$SelectedElementListCopyWithImpl<$Res>
    extends _$SelectedElementListCopyWithImpl<$Res>
    implements _$SelectedElementListCopyWith<$Res> {
  __$SelectedElementListCopyWithImpl(
      _SelectedElementList _value, $Res Function(_SelectedElementList) _then)
      : super(_value, (v) => _then(v as _SelectedElementList));

  @override
  _SelectedElementList get _value => super._value as _SelectedElementList;

  @override
  $Res call({
    Object? selectedElements = freezed,
  }) {
    return _then(_SelectedElementList(
      selectedElements: selectedElements == freezed
          ? _value.selectedElements
          : selectedElements // ignore: cast_nullable_to_non_nullable
              as List<SelectedElement>,
    ));
  }
}

/// @nodoc

class _$_SelectedElementList
    with DiagnosticableTreeMixin
    implements _SelectedElementList {
  const _$_SelectedElementList(
      {this.selectedElements = const <SelectedElement>[]});

  @JsonKey()
  @override
  final List<SelectedElement> selectedElements;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelectedElementList(selectedElements: $selectedElements)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelectedElementList'))
      ..add(DiagnosticsProperty('selectedElements', selectedElements));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectedElementList &&
            const DeepCollectionEquality()
                .equals(other.selectedElements, selectedElements));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(selectedElements));

  @JsonKey(ignore: true)
  @override
  _$SelectedElementListCopyWith<_SelectedElementList> get copyWith =>
      __$SelectedElementListCopyWithImpl<_SelectedElementList>(
          this, _$identity);
}

abstract class _SelectedElementList implements SelectedElementList {
  const factory _SelectedElementList({List<SelectedElement> selectedElements}) =
      _$_SelectedElementList;

  @override
  List<SelectedElement> get selectedElements;
  @override
  @JsonKey(ignore: true)
  _$SelectedElementListCopyWith<_SelectedElementList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SelectedElementTearOff {
  const _$SelectedElementTearOff();

  _SelectedElement call({required Key elementKey, required bool selected}) {
    return _SelectedElement(
      elementKey: elementKey,
      selected: selected,
    );
  }
}

/// @nodoc
const $SelectedElement = _$SelectedElementTearOff();

/// @nodoc
mixin _$SelectedElement {
  Key get elementKey => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectedElementCopyWith<SelectedElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedElementCopyWith<$Res> {
  factory $SelectedElementCopyWith(
          SelectedElement value, $Res Function(SelectedElement) then) =
      _$SelectedElementCopyWithImpl<$Res>;
  $Res call({Key elementKey, bool selected});
}

/// @nodoc
class _$SelectedElementCopyWithImpl<$Res>
    implements $SelectedElementCopyWith<$Res> {
  _$SelectedElementCopyWithImpl(this._value, this._then);

  final SelectedElement _value;
  // ignore: unused_field
  final $Res Function(SelectedElement) _then;

  @override
  $Res call({
    Object? elementKey = freezed,
    Object? selected = freezed,
  }) {
    return _then(_value.copyWith(
      elementKey: elementKey == freezed
          ? _value.elementKey
          : elementKey // ignore: cast_nullable_to_non_nullable
              as Key,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SelectedElementCopyWith<$Res>
    implements $SelectedElementCopyWith<$Res> {
  factory _$SelectedElementCopyWith(
          _SelectedElement value, $Res Function(_SelectedElement) then) =
      __$SelectedElementCopyWithImpl<$Res>;
  @override
  $Res call({Key elementKey, bool selected});
}

/// @nodoc
class __$SelectedElementCopyWithImpl<$Res>
    extends _$SelectedElementCopyWithImpl<$Res>
    implements _$SelectedElementCopyWith<$Res> {
  __$SelectedElementCopyWithImpl(
      _SelectedElement _value, $Res Function(_SelectedElement) _then)
      : super(_value, (v) => _then(v as _SelectedElement));

  @override
  _SelectedElement get _value => super._value as _SelectedElement;

  @override
  $Res call({
    Object? elementKey = freezed,
    Object? selected = freezed,
  }) {
    return _then(_SelectedElement(
      elementKey: elementKey == freezed
          ? _value.elementKey
          : elementKey // ignore: cast_nullable_to_non_nullable
              as Key,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SelectedElement
    with DiagnosticableTreeMixin
    implements _SelectedElement {
  const _$_SelectedElement({required this.elementKey, required this.selected});

  @override
  final Key elementKey;
  @override
  final bool selected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelectedElement(elementKey: $elementKey, selected: $selected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelectedElement'))
      ..add(DiagnosticsProperty('elementKey', elementKey))
      ..add(DiagnosticsProperty('selected', selected));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectedElement &&
            const DeepCollectionEquality()
                .equals(other.elementKey, elementKey) &&
            const DeepCollectionEquality().equals(other.selected, selected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(elementKey),
      const DeepCollectionEquality().hash(selected));

  @JsonKey(ignore: true)
  @override
  _$SelectedElementCopyWith<_SelectedElement> get copyWith =>
      __$SelectedElementCopyWithImpl<_SelectedElement>(this, _$identity);
}

abstract class _SelectedElement implements SelectedElement {
  const factory _SelectedElement(
      {required Key elementKey, required bool selected}) = _$_SelectedElement;

  @override
  Key get elementKey;
  @override
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$SelectedElementCopyWith<_SelectedElement> get copyWith =>
      throw _privateConstructorUsedError;
}
