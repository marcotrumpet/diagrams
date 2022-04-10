// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abstract_flow_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AbstractFlowElementToJson(AbstractFlowElement instance) {
  final val = <String, dynamic>{
    'hashCode': instance.hashCode,
  };

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
