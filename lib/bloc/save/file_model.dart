import 'package:diagrams/bloc/arrows/arrow_model.dart';
import 'package:diagrams/common/json_converter_methods.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_model.freezed.dart';
part 'file_model.g.dart';

@freezed
class FileModel with _$FileModel {
  const factory FileModel({
    @JsonKey(fromJson: abstractFlowElementsListFromJson)
        required List<AbstractFlowElement?> abstractFlowElementsList,
    required Set<ArrowModel> arrowModelList,
    required String packageName,
    required String version,
    required String buildNumber,
  }) = _FileModel;
  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);
}
