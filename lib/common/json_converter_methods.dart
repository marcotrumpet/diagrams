import 'dart:convert';
import 'dart:ui';

import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:flutter/material.dart';

String offsetRequiredToJson(Offset offset) => json.encode({
      'offset': {'dx': "${offset.dx}", 'dy': "${offset.dy}"},
    });
Offset offsetRequiredFromJson(String j) {
  Map<String, dynamic> _js = json.decode(j);
  Map<String, dynamic> _offset = _js['offset'];
  return Offset(_offset['dx'] as double, _offset['dy'] as double);
}

String offsetToJson(Offset? offset) => json.encode({
      'offset': {'dx': "${offset?.dx}", 'dy': "${offset?.dy}"},
    });
Offset? offsetFromJson(String j) {
  Map<String, dynamic> _js = json.decode(j);
  Map<String, dynamic> _offset = _js['offset'];
  return Offset(_offset['dx'] as double, _offset['dy'] as double);
}

String offsetListToJson(List<Offset>? offsets) => json.encode(
      offsets
          ?.map(
            (e) => offsetToJson(e),
          )
          .toList(),
    );
List<Offset>? offsetListFromJson(String j) {
  List<String> _js = json.decode(j);
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
  // Map<String, dynamic> _jsonPath = json.decode(p);
  // List<Map<String, dynamic>> _pointsInPath = _jsonPath['pointsInPath'];
  // TODO check what's in this
  return Path();
}

String keyToJson(Key? k) => k.toString();
Key? keyFromJson(String k) => Key(k);

String keyRequiredToJson(Key k) => k.toString();
Key keyRequiredFromJson(String k) => Key(k);

String abstractFlowElementToJson(AbstractFlowElement? a) {
  return json.encode(a?.toJson());
}

// TODO make this
AbstractFlowElement? abstractFlowElementFromJson(String a) => null;
