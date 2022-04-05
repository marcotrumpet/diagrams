import 'package:diagrams/flow_elements/anchor_points/anchor_point_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anchor_point_model_map.freezed.dart';
part 'anchor_point_model_map.g.dart';

@freezed
class AnchorPointModelMap with _$AnchorPointModelMap {
  const factory AnchorPointModelMap({
    required List<AnchorPointModel> anchorPointList,
  }) = _AnchorPointModelMap;
  factory AnchorPointModelMap.fromJson(Map<String, dynamic> json) =>
      _$AnchorPointModelMapFromJson(json);
}
