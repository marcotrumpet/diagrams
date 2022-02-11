import 'package:diagrams/flow_elements/abstract_flow_element.dart';

abstract class AbstractAddRemoveElementEvent {
  final AbstractFlowElement elementToManipulate;

  AbstractAddRemoveElementEvent({required this.elementToManipulate});
}

class AddElementEvent extends AbstractAddRemoveElementEvent {
  AddElementEvent({required AbstractFlowElement elementToManipulate})
      : super(elementToManipulate: elementToManipulate);
}

class RemoveElementEvent extends AbstractAddRemoveElementEvent {
  RemoveElementEvent({required AbstractFlowElement elementToManipulate})
      : super(elementToManipulate: elementToManipulate);
}
