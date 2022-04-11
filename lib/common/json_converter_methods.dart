import 'dart:convert';
import 'dart:ui';

import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/circle/circle_flow_element.dart';
import 'package:diagrams/flow_elements/rectangle/rectangle_flow_element.dart';
import 'package:diagrams/flow_elements/rounded_rectangle/rounded_rectangle_flow_element.dart';
import 'package:diagrams/flow_elements/triangle/triangle_flow_element.dart';
import 'package:flutter/material.dart';

String offsetRequiredToJson(Offset offset) => json.encode({
      'offset': {'dx': "${offset.dx}", 'dy': "${offset.dy}"},
    });
Offset offsetRequiredFromJson(String j) {
  Map<String, dynamic> _js = json.decode(j);
  Map<String, dynamic> _offset = _js['offset'];
  return Offset(double.tryParse(_offset['dx']) ?? 0.0,
      double.tryParse(_offset['dy']) ?? 0.0);
}

String? offsetToJson(Offset? offset) {
  if (offset == null) return null;
  return json.encode({
    'offset': {'dx': "${offset.dx}", 'dy': "${offset.dy}"}
  });
}

Offset? offsetFromJson(String? j) {
  if (j == null || j.isEmpty) return null;
  Map<String, dynamic> _js = json.decode(j);
  Map<String, dynamic> _offset = _js['offset'];
  return Offset(double.tryParse(_offset['dx']) ?? 0.0,
      double.tryParse(_offset['dy']) ?? 0.0);
}

String offsetListToJson(List<Offset>? offsets) {
  if (offsets == null) return '';
  return json.encode(
    offsets
        .map(
          (e) => offsetToJson(e),
        )
        .toList(),
  );
}

List<Offset>? offsetListFromJson(String j) {
  List<dynamic> _js = json.decode(j) ?? [];
  return _js.map((e) => offsetRequiredFromJson(e)).toList();
}

String pathToJson(Path path) {
  var pointsInPath = <Offset?>[];
  for (PathMetric pathMetric in path.computeMetrics().toList()) {
    for (var i = 0.0; i < pathMetric.length; i++) {
      pointsInPath.add(pathMetric.getTangentForOffset(i)?.position);
    }
  }

  var pointsInJson = pointsInPath.map((e) => offsetToJson(e)).toList();
  return json.encode(pointsInJson);
}

Path pathFromJson(String p) {
  var offsetList = offsetListFromJson(p);
  var path = Path();

  path.moveTo(offsetList!.first.dx, offsetList.first.dy);

  for (var i = 0; i < offsetList.length; i++) {
    path.lineTo(offsetList[i].dx, offsetList[i].dy);
  }
  path.close();
  return path;
}

String keyToJson(Key? k) {
  return k.toString();
}

Key? keyFromJson(String k) {
  return Key(k);
}

String keyRequiredToJson(Key k) => k.toString();
Key keyRequiredFromJson(String k) => Key(k);

String flowElementTypesToJson(FlowElementTypes t) {
  switch (t) {
    case FlowElementTypes.rectangle:
      return 'rectangle_flow_element';
    case FlowElementTypes.roundedRectangle:
      return 'rounded_rectangle_flow_element';
    case FlowElementTypes.triangle:
      return 'triangle_flow_element';
    case FlowElementTypes.circle:
      return 'circle_flow_element';
  }
}

FlowElementTypes flowElementTypesFromJson(String f) {
  switch (f) {
    case 'rectangle_flow_element':
      return FlowElementTypes.rectangle;
    case 'rounded_rectangle_flow_element':
      return FlowElementTypes.roundedRectangle;
    case 'triangle_flow_element':
      return FlowElementTypes.triangle;
    case 'circle_flow_element':
      return FlowElementTypes.circle;
    default:
      return FlowElementTypes.rectangle;
  }
}

String abstractFlowElementToJson(AbstractFlowElement? a) {
  return json.encode(a?.toJson());
}

AbstractFlowElement? abstractFlowElementFromJson(String s) {
  var map = json.decode(s);
  if (map == null) return null;
  var flowType = flowElementTypesFromJson(map['flowType']);
  switch (flowType) {
    case FlowElementTypes.rectangle:
      return RectangleFlowElement.fromJson(map);
    case FlowElementTypes.roundedRectangle:
      return RoundedRectangleFlowElement.fromJson(map);
    case FlowElementTypes.triangle:
      return TriangleFlowElement.fromJson(map);
    case FlowElementTypes.circle:
      return CircleFlowElement.fromJson(map);
  }
}

List<AbstractFlowElement?> abstractFlowElementsListFromJson(
    List<dynamic> list) {
  return list.map((e) => abstractFlowElementFromJson(json.encode(e))).toList();
}

String alignmentToJson(Alignment a) {
  return a.toString();
}

Alignment alignmentFromJson(String s) {
  switch (s) {
    case 'Alignment.topLeft':
      return Alignment.topLeft;
    case 'Alignment.topCenter':
      return Alignment.topCenter;
    case 'Alignment.topRight':
      return Alignment.topRight;
    case 'Alignment.centerLeft':
      return Alignment.centerLeft;
    case 'Alignment.center':
      return Alignment.center;
    case 'Alignment.centerRight':
      return Alignment.centerRight;
    case 'Alignment.bottomLeft':
      return Alignment.bottomLeft;
    case 'Alignment.bottomCenter':
      return Alignment.bottomCenter;
    case 'Alignment.bottomRight':
      return Alignment.bottomRight;
    default:
      return Alignment.topLeft;
  }
}
