// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rounded_rectangle_flow_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoundedRectangleFlowElement _$RoundedRectangleFlowElementFromJson(
        Map<String, dynamic> json) =>
    RoundedRectangleFlowElement(
      flowType: $enumDecode(_$FlowElementTypesEnumMap, json['flowType']),
      path: pathFromJson(json['path'] as String),
      offset: offsetFromJson(json['offset'] as String),
      elementKey: keyFromJson(json['elementKey'] as String),
      isSideMenu: json['isSideMenu'] ?? false,
    );

Map<String, dynamic> _$RoundedRectangleFlowElementToJson(
        RoundedRectangleFlowElement instance) =>
    <String, dynamic>{
      'flowType': _$FlowElementTypesEnumMap[instance.flowType],
      'offset': offsetToJson(instance.offset),
      'elementKey': keyToJson(instance.elementKey),
      'path': pathToJson(instance.path),
      'isSideMenu': instance.isSideMenu,
    };

const _$FlowElementTypesEnumMap = {
  FlowElementTypes.rectangle: 'rectangle_flow_element',
  FlowElementTypes.roundedRectangle: 'rounded_rectangle_flow_element',
  FlowElementTypes.triangle: 'triangle_flow_element',
  FlowElementTypes.circle: 'circle_flow_element',
};
