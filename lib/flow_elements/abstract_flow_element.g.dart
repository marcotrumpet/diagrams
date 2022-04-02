// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abstract_flow_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AbstractFlowElementToJson(
        AbstractFlowElement instance) =>
    <String, dynamic>{
      'hashCode': instance.hashCode,
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
