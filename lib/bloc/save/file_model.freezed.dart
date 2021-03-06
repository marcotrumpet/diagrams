// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileModel _$FileModelFromJson(Map<String, dynamic> json) {
  return _FileModel.fromJson(json);
}

/// @nodoc
class _$FileModelTearOff {
  const _$FileModelTearOff();

  _FileModel call(
      {@JsonKey(fromJson: abstractFlowElementsListFromJson)
          required List<AbstractFlowElement?> abstractFlowElementsList,
      required Set<ArrowModel> arrowModelList,
      required String packageName,
      required String version,
      required String buildNumber}) {
    return _FileModel(
      abstractFlowElementsList: abstractFlowElementsList,
      arrowModelList: arrowModelList,
      packageName: packageName,
      version: version,
      buildNumber: buildNumber,
    );
  }

  FileModel fromJson(Map<String, Object?> json) {
    return FileModel.fromJson(json);
  }
}

/// @nodoc
const $FileModel = _$FileModelTearOff();

/// @nodoc
mixin _$FileModel {
  @JsonKey(fromJson: abstractFlowElementsListFromJson)
  List<AbstractFlowElement?> get abstractFlowElementsList =>
      throw _privateConstructorUsedError;
  Set<ArrowModel> get arrowModelList => throw _privateConstructorUsedError;
  String get packageName => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get buildNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileModelCopyWith<FileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileModelCopyWith<$Res> {
  factory $FileModelCopyWith(FileModel value, $Res Function(FileModel) then) =
      _$FileModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(fromJson: abstractFlowElementsListFromJson)
          List<AbstractFlowElement?> abstractFlowElementsList,
      Set<ArrowModel> arrowModelList,
      String packageName,
      String version,
      String buildNumber});
}

/// @nodoc
class _$FileModelCopyWithImpl<$Res> implements $FileModelCopyWith<$Res> {
  _$FileModelCopyWithImpl(this._value, this._then);

  final FileModel _value;
  // ignore: unused_field
  final $Res Function(FileModel) _then;

  @override
  $Res call({
    Object? abstractFlowElementsList = freezed,
    Object? arrowModelList = freezed,
    Object? packageName = freezed,
    Object? version = freezed,
    Object? buildNumber = freezed,
  }) {
    return _then(_value.copyWith(
      abstractFlowElementsList: abstractFlowElementsList == freezed
          ? _value.abstractFlowElementsList
          : abstractFlowElementsList // ignore: cast_nullable_to_non_nullable
              as List<AbstractFlowElement?>,
      arrowModelList: arrowModelList == freezed
          ? _value.arrowModelList
          : arrowModelList // ignore: cast_nullable_to_non_nullable
              as Set<ArrowModel>,
      packageName: packageName == freezed
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: buildNumber == freezed
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FileModelCopyWith<$Res> implements $FileModelCopyWith<$Res> {
  factory _$FileModelCopyWith(
          _FileModel value, $Res Function(_FileModel) then) =
      __$FileModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(fromJson: abstractFlowElementsListFromJson)
          List<AbstractFlowElement?> abstractFlowElementsList,
      Set<ArrowModel> arrowModelList,
      String packageName,
      String version,
      String buildNumber});
}

/// @nodoc
class __$FileModelCopyWithImpl<$Res> extends _$FileModelCopyWithImpl<$Res>
    implements _$FileModelCopyWith<$Res> {
  __$FileModelCopyWithImpl(_FileModel _value, $Res Function(_FileModel) _then)
      : super(_value, (v) => _then(v as _FileModel));

  @override
  _FileModel get _value => super._value as _FileModel;

  @override
  $Res call({
    Object? abstractFlowElementsList = freezed,
    Object? arrowModelList = freezed,
    Object? packageName = freezed,
    Object? version = freezed,
    Object? buildNumber = freezed,
  }) {
    return _then(_FileModel(
      abstractFlowElementsList: abstractFlowElementsList == freezed
          ? _value.abstractFlowElementsList
          : abstractFlowElementsList // ignore: cast_nullable_to_non_nullable
              as List<AbstractFlowElement?>,
      arrowModelList: arrowModelList == freezed
          ? _value.arrowModelList
          : arrowModelList // ignore: cast_nullable_to_non_nullable
              as Set<ArrowModel>,
      packageName: packageName == freezed
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: buildNumber == freezed
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FileModel implements _FileModel {
  const _$_FileModel(
      {@JsonKey(fromJson: abstractFlowElementsListFromJson)
          required this.abstractFlowElementsList,
      required this.arrowModelList,
      required this.packageName,
      required this.version,
      required this.buildNumber});

  factory _$_FileModel.fromJson(Map<String, dynamic> json) =>
      _$$_FileModelFromJson(json);

  @override
  @JsonKey(fromJson: abstractFlowElementsListFromJson)
  final List<AbstractFlowElement?> abstractFlowElementsList;
  @override
  final Set<ArrowModel> arrowModelList;
  @override
  final String packageName;
  @override
  final String version;
  @override
  final String buildNumber;

  @override
  String toString() {
    return 'FileModel(abstractFlowElementsList: $abstractFlowElementsList, arrowModelList: $arrowModelList, packageName: $packageName, version: $version, buildNumber: $buildNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FileModel &&
            const DeepCollectionEquality().equals(
                other.abstractFlowElementsList, abstractFlowElementsList) &&
            const DeepCollectionEquality()
                .equals(other.arrowModelList, arrowModelList) &&
            const DeepCollectionEquality()
                .equals(other.packageName, packageName) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality()
                .equals(other.buildNumber, buildNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(abstractFlowElementsList),
      const DeepCollectionEquality().hash(arrowModelList),
      const DeepCollectionEquality().hash(packageName),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(buildNumber));

  @JsonKey(ignore: true)
  @override
  _$FileModelCopyWith<_FileModel> get copyWith =>
      __$FileModelCopyWithImpl<_FileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileModelToJson(this);
  }
}

abstract class _FileModel implements FileModel {
  const factory _FileModel(
      {@JsonKey(fromJson: abstractFlowElementsListFromJson)
          required List<AbstractFlowElement?> abstractFlowElementsList,
      required Set<ArrowModel> arrowModelList,
      required String packageName,
      required String version,
      required String buildNumber}) = _$_FileModel;

  factory _FileModel.fromJson(Map<String, dynamic> json) =
      _$_FileModel.fromJson;

  @override
  @JsonKey(fromJson: abstractFlowElementsListFromJson)
  List<AbstractFlowElement?> get abstractFlowElementsList;
  @override
  Set<ArrowModel> get arrowModelList;
  @override
  String get packageName;
  @override
  String get version;
  @override
  String get buildNumber;
  @override
  @JsonKey(ignore: true)
  _$FileModelCopyWith<_FileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
