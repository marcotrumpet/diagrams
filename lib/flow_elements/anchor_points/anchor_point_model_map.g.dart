// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anchor_point_model_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnchorPointModelMap _$$_AnchorPointModelMapFromJson(
        Map<String, dynamic> json) =>
    _$_AnchorPointModelMap(
      anchorPointList: (json['anchorPointList'] as List<dynamic>)
          .map((e) => AnchorPointModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AnchorPointModelMapToJson(
        _$_AnchorPointModelMap instance) =>
    <String, dynamic>{
      'anchorPointList': instance.anchorPointList,
    };
