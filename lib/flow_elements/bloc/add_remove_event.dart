import 'package:diagrams/flow_elements/abstract_flow_element.dart';

abstract class AbstractAddRemoveEvent {
  final AbstractFlowElement elementToManipulate;

  AbstractAddRemoveEvent({required this.elementToManipulate});
}

class AddEvent extends AbstractAddRemoveEvent {
  AddEvent({required AbstractFlowElement elementToManipulate})
      : super(elementToManipulate: elementToManipulate);
}

class RemoveEvent extends AbstractAddRemoveEvent {
  RemoveEvent({required AbstractFlowElement elementToManipulate})
      : super(elementToManipulate: elementToManipulate);
}
