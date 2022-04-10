// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rounded_rectangle_flow_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoundedRectangleFlowElement _$RoundedRectangleFlowElementFromJson(
        Map<String, dynamic> json) =>
    RoundedRectangleFlowElement(
      flowType: flowElementTypesFromJson(json['flowType'] as String),
      path: pathFromJson(json['path'] as String),
      offset: offsetFromJson(json['offset'] as String),
      elementKey: keyFromJson(json['elementKey'] as String),
      anchorPointsModelMap: json['anchorPointsModelMap'] == null
          ? null
          : AnchorPointModelMap.fromJson(
              json['anchorPointsModelMap'] as Map<String, dynamic>),
      isSideMenu: json['isSideMenu'] ?? false,
    );

Map<String, dynamic> _$RoundedRectangleFlowElementToJson(
    RoundedRectangleFlowElement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('flowType', flowElementTypesToJson(instance.flowType));
  writeNotNull('offset', offsetToJson(instance.offset));
  writeNotNull('elementKey', keyToJson(instance.elementKey));
  writeNotNull('path', pathToJson(instance.path));
  writeNotNull('anchorPointsModelMap', instance.anchorPointsModelMap);
  val['isSideMenu'] = instance.isSideMenu;
  return val;
}
