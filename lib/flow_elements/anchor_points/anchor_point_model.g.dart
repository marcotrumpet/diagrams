// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anchor_point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnchorPointModel _$$_AnchorPointModelFromJson(Map<String, dynamic> json) =>
    _$_AnchorPointModel(
      anchorPointKey: keyRequiredFromJson(json['anchorPointKey'] as String),
      anchorPointPosition:
          offsetRequiredFromJson(json['anchorPointPosition'] as String),
      anchorPointPositionRelativeToParent: offsetRequiredFromJson(
          json['anchorPointPositionRelativeToParent'] as String),
      alignment: alignmentFromJson(json['alignment'] as String),
      arrowModelStart: (json['arrowModelStart'] as List<dynamic>?)
          ?.map((e) => ArrowModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      arrowModelEnd: (json['arrowModelEnd'] as List<dynamic>?)
          ?.map((e) => ArrowModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AnchorPointModelToJson(_$_AnchorPointModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('anchorPointKey', keyRequiredToJson(instance.anchorPointKey));
  writeNotNull('anchorPointPosition',
      offsetRequiredToJson(instance.anchorPointPosition));
  writeNotNull('anchorPointPositionRelativeToParent',
      offsetRequiredToJson(instance.anchorPointPositionRelativeToParent));
  writeNotNull('alignment', alignmentToJson(instance.alignment));
  writeNotNull('arrowModelStart', instance.arrowModelStart);
  writeNotNull('arrowModelEnd', instance.arrowModelEnd);
  return val;
}
