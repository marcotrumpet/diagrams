import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/anchor_points/anchor_point_model.dart';
import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/flow_elements/rectangle/rectangle_flow_element.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

void drawArrowsBlocTest() {
  late DrawArrowsBloc drawArrowsBloc;

  final _random = Random();

  var endPoint = Offset(_random.nextDouble(), _random.nextDouble());
  var startPoint = Offset(_random.nextDouble(), _random.nextDouble());
  var endPointKey = const Key('endPointKey');
  var startPointKey = const Key('startPointKey');
  var arrowKey = const Key('arrowKey');

  var endElement = RectangleFlowElement(
      path: Path(),
      flowType: FlowElementTypes.rectangle,
      offset: const Offset(10, 10),
      elementKey: const Key('endElementKey'),
      anchorPointsModelMap: AnchorPointModelMap(
        anchorPointList: [
          AnchorPointModel(
            anchorPointKey: endPointKey,
            anchorPointPosition: endPoint,
            anchorPointPositionRelativeToParent:
                endPoint + const Offset(10, 10),
            alignment: Alignment.topLeft,
          ),
        ],
        child: Container(),
      ));
  var startElement = RectangleFlowElement(
      path: Path(),
      flowType: FlowElementTypes.rectangle,
      offset: const Offset(100, 100),
      elementKey: const Key('startElementKey'),
      anchorPointsModelMap: AnchorPointModelMap(
        anchorPointList: [
          AnchorPointModel(
            anchorPointKey: startPointKey,
            anchorPointPosition: startPoint,
            anchorPointPositionRelativeToParent:
                startPoint + const Offset(100, 100),
            alignment: Alignment.topLeft,
          ),
        ],
        child: Container(),
      ));

  var arrowModel = ArrowModel(
    startPoint: startPoint,
    startPointKey: startPointKey,
    endPoint: endPoint,
    endPointKey: endPointKey,
    endElement: endElement,
    startElement: startElement,
    arrowKey: arrowKey,
  );

  setUp(() {
    drawArrowsBloc = DrawArrowsBloc(const DrawArrowsState());

    var newStartElement = startElement.copyWith(
      anchorPointsModelMap: startElement.anchorPointsModelMap!.copyWith(
        anchorPointList: [
          startElement.anchorPointsModelMap!.anchorPointList.first
              .copyWith(arrowModelStart: [arrowModel]),
        ],
      ),
    );
    var newEndElement = endElement.copyWith(
      anchorPointsModelMap: endElement.anchorPointsModelMap!.copyWith(
        anchorPointList: [
          endElement.anchorPointsModelMap!.anchorPointList.first
              .copyWith(arrowModelEnd: [arrowModel]),
        ],
      ),
    );

    startElement = newStartElement;
    endElement = newEndElement;

    arrowModel.copyWith(
        startElement: newStartElement, endElement: newEndElement);
  });

  group('drawArrowsBloc', () {
    test('no arrows when initialized', () {
      expect(drawArrowsBloc.arrowModelList, <ArrowModel>{});
      expect(drawArrowsBloc.lastArrowDrawnKey, const Key(''));
    });

    blocTest<DrawArrowsBloc, DrawArrowsState>(
      'is empty when initialized',
      build: () => drawArrowsBloc,
      expect: () => [],
      verify: (bloc) {
        if (drawArrowsBloc.arrowModelList.isNotEmpty) {
          throw Exception('arrowModelList is not empty');
        }
        if (drawArrowsBloc.lastArrowDrawnKey != const Key('')) {
          throw Exception(
              'last arrow drawn key is different then actual arrow key');
        }
      },
    );

    blocTest<DrawArrowsBloc, DrawArrowsState>(
      'start new arrow',
      build: () => drawArrowsBloc,
      act: (bloc) => bloc.add(
        StartNewArrowEvent(
          arrowModel: ArrowModel(
            startPoint: Offset(_random.nextDouble(), _random.nextDouble()),
            startPointKey: const Key('startPointKey'),
            endPoint: Offset(_random.nextDouble(), _random.nextDouble()),
            arrowKey: const Key('arrowKey'),
          ),
        ),
      ),
      expect: () => [],
      verify: (bloc) {
        if (drawArrowsBloc.arrowModelList.isEmpty) {
          throw Exception('arrowModelList is empty');
        }
        if (drawArrowsBloc.lastArrowDrawnKey != const Key('arrowKey')) {
          throw Exception(
              'last arrow drawn key is different then actual arrow key');
        }
      },
    );

    blocTest<DrawArrowsBloc, DrawArrowsState>(
      'add endpoint to specific arrow',
      build: () => drawArrowsBloc,
      act: (bloc) {
        bloc.arrowModelList.add(arrowModel);

        bloc.add(
          DrawArrowsEvent(
            arrowKey: arrowModel.arrowKey,
            endPoint: endPoint,
            endPointKey: endPointKey,
            endElement: endElement,
          ),
        );
      },
      expect: () => [
        DrawArrowsState(
          arrowModel: arrowModel.copyWith(
            endPoint: endPoint,
            endPointKey: endPointKey,
            endElement: endElement,
          ),
        ),
      ],
    );

    blocTest<DrawArrowsBloc, DrawArrowsState>(
      'add event to notify arrow to update A* algorithm',
      build: () => drawArrowsBloc,
      act: (bloc) => bloc.add(
        DrawArrowsAStarEvent(
          arrowModel: arrowModel.copyWith(updateAStarPath: true),
        ),
      ),
      expect: () => [
        DrawArrowsState(
          arrowModel: arrowModel.copyWith(updateAStarPath: true),
        ),
      ],
    );

    blocTest<DrawArrowsBloc, DrawArrowsState>(
      'reset updateAStarPath variable',
      build: () => drawArrowsBloc,
      act: (bloc) => bloc.add(
        DrawArrowsAStarEvent(
          arrowModel: arrowModel.copyWith(updateAStarPath: false),
        ),
      ),
      expect: () => [
        DrawArrowsState(
          arrowModel: arrowModel.copyWith(updateAStarPath: false),
        ),
      ],
    );

    blocTest<DrawArrowsBloc, DrawArrowsState>(
      'check if moved elements updates arrow model accordingly',
      build: () => drawArrowsBloc,
      act: (bloc) {
        bloc.arrowModelList.add(arrowModel);

        bloc.add(
          MovedFlowElementUpdateArrowsEvent(element: startElement),
        );

        bloc.add(
          MovedFlowElementUpdateArrowsEvent(element: endElement),
        );
      },
      expect: () => [
        DrawArrowsState(
          arrowModel: arrowModel.copyWith(
            startPoint: startElement.anchorPointsModelMap!.anchorPointList.first
                .anchorPointPositionRelativeToParent,
            updateAStarPath: true,
          ),
        ),
        DrawArrowsState(
          arrowModel: arrowModel.copyWith(
            startPoint: startElement.anchorPointsModelMap!.anchorPointList.first
                .anchorPointPositionRelativeToParent,
            endPoint: endElement.anchorPointsModelMap!.anchorPointList.first
                .anchorPointPositionRelativeToParent,
            updateAStarPath: true,
          ),
        ),
      ],
    );

    blocTest<DrawArrowsBloc, DrawArrowsState>(
      'save path to corresponding arrow',
      build: () => drawArrowsBloc,
      act: (bloc) {
        bloc.arrowModelList.add(arrowModel);

        bloc.add(
          SavePathToArrowEvent(
              arrowKey: arrowKey,
              arrowPath: const [Offset(50, 50), Offset(51, 51)]),
        );
      },
      expect: () => [],
      verify: (bloc) {
        if (drawArrowsBloc.arrowModelList.isEmpty) {
          throw Exception('arrowModelList is empty');
        }
        var arrow = drawArrowsBloc.arrowModelList
            .firstWhereOrNull((e) => e.arrowKey == arrowKey);

        if (arrow == null) throw Exception('arrow not found');

        if (arrow.currentArrowPath != const [Offset(50, 50), Offset(51, 51)]) {
          throw Exception(
              'arrow current path different from the dispatched one');
        }
      },
    );

    blocTest<DrawArrowsBloc, DrawArrowsState>(
      'delete arrow',
      build: () => drawArrowsBloc,
      act: (bloc) {
        bloc.arrowModelList.add(arrowModel);

        bloc.add(RemoveArrowStartingFromPointEvent(arrowKeys: [arrowKey]));
      },
      expect: () => [
        DrawArrowsState.remove(
          arrowKey: arrowKey,
        )
      ],
      verify: (bloc) {
        if (bloc.arrowModelList
            .where((element) => element.arrowKey == arrowKey)
            .isNotEmpty) {
          throw Exception('arrow deletion failed');
        }
      },
    );

    blocTest<DrawArrowsBloc, DrawArrowsState>(
      'update arrow',
      build: () => drawArrowsBloc,
      act: (bloc) {
        bloc.arrowModelList.add(arrowModel);

        bloc.add(
          UpdateArrowModelEvent(
            model: ArrowModel(
              startPoint: const Offset(5, 5),
              startPointKey: const Key('startPointKey'),
              endPoint: const Offset(115, 15),
              arrowKey: arrowKey,
            ),
          ),
        );
      },
      expect: () => [],
      verify: (bloc) {
        var arrow = bloc.arrowModelList
            .firstWhereOrNull((element) => element.arrowKey == arrowKey);

        if (arrow == null) throw Exception('arrow not found');

        if (arrow.startPoint != const Offset(5, 5) ||
            arrow.endPoint != const Offset(115, 15)) {
          throw Exception('arrow startPoint or endPoint match failed');
        }
      },
    );
  });
}
