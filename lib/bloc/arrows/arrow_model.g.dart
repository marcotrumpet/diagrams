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

Map<String, dynamic> _$$_ArrowModelToJson(_$_ArrowModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('startPoint', offsetRequiredToJson(instance.startPoint));
  writeNotNull('startPointKey', keyRequiredToJson(instance.startPointKey));
  writeNotNull('endPoint', offsetRequiredToJson(instance.endPoint));
  writeNotNull('endPointKey', keyToJson(instance.endPointKey));
  writeNotNull('arrowKey', keyRequiredToJson(instance.arrowKey));
  writeNotNull(
      'startElement', abstractFlowElementToJson(instance.startElement));
  writeNotNull('endElement', abstractFlowElementToJson(instance.endElement));
  writeNotNull('updateAStarPath', instance.updateAStarPath);
  writeNotNull('currentArrowPath', offsetListToJson(instance.currentArrowPath));
  return val;
}
