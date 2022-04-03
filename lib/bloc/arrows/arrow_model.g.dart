// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arrow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArrowModel _$$_ArrowModelFromJson(Map<String, dynamic> json) =>
    _$_ArrowModel(
      startPoint: offsetRequiredFromJson(json['startPoint'] as String),
      startPointKey: keyRequiredFromJson(json['startPointKey'] as String),
      endPoint: offsetRequiredFromJson(json['endPoint'] as String),
      endPointKey: keyFromJson(json['endPointKey'] as String),
      arrowKey: keyRequiredFromJson(json['arrowKey'] as String),
      startElement: abstractFlowElementFromJson(json['startElement'] as String),
      endElement: abstractFlowElementFromJson(json['endElement'] as String),
      updateAStarPath: json['updateAStarPath'] as bool? ?? false,
      currentArrowPath: offsetListFromJson(json['currentArrowPath'] as String),
    );

Map<String, dynamic> _$$_ArrowModelToJson(_$_ArrowModel instance) =>
    <String, dynamic>{
      'startPoint': offsetRequiredToJson(instance.startPoint),
      'startPointKey': keyRequiredToJson(instance.startPointKey),
      'endPoint': offsetRequiredToJson(instance.endPoint),
      'endPointKey': keyToJson(instance.endPointKey),
      'arrowKey': keyRequiredToJson(instance.arrowKey),
      'startElement': abstractFlowElementToJson(instance.startElement),
      'endElement': abstractFlowElementToJson(instance.endElement),
      'updateAStarPath': instance.updateAStarPath,
      'currentArrowPath': offsetListToJson(instance.currentArrowPath),
    };
