// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FileModel _$$_FileModelFromJson(Map<String, dynamic> json) => _$_FileModel(
      abstractFlowElementsList: abstractFlowElementsListFromJson(
          json['abstractFlowElementsList'] as List),
      arrowModelList: (json['arrowModelList'] as List<dynamic>)
          .map((e) => ArrowModel.fromJson(e as Map<String, dynamic>))
          .toSet(),
      packageName: json['packageName'] as String,
      version: json['version'] as String,
      buildNumber: json['buildNumber'] as String,
    );

Map<String, dynamic> _$$_FileModelToJson(_$_FileModel instance) =>
    <String, dynamic>{
      'abstractFlowElementsList': instance.abstractFlowElementsList,
      'arrowModelList': instance.arrowModelList.toList(),
      'packageName': instance.packageName,
      'version': instance.version,
      'buildNumber': instance.buildNumber,
    };
