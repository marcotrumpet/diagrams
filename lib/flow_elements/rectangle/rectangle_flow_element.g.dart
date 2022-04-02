// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rectangle_flow_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RectangleFlowElement _$RectangleFlowElementFromJson(
        Map<String, dynamic> json) =>
    RectangleFlowElement(
      flowType: $enumDecode(_$FlowElementTypesEnumMap, json['flowType']),
      path: pathFromJson(json['path'] as String),
      offset: offsetFromJson(json['offset'] as String),
      elementKey: keyFromJson(json['elementKey'] as String),
      isSideMenu: json['isSideMenu'] ?? false,
    );

Map<String, dynamic> _$RectangleFlowElementToJson(
        RectangleFlowElement instance) =>
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
