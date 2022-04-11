import 'dart:ui';

import 'package:diagrams/common/json_converter_methods.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void jsonConverterMethods() {
  group('offset tests', () {
    test('offsetRequiredToJson', () {
      var string = offsetRequiredToJson(const Offset(50, 50));

      expect(string, '{"offset":{"dx":"50.0","dy":"50.0"}}');
    });

    test('offsetRequiredFromJson', () {
      var offset =
          offsetRequiredFromJson('{"offset":{"dx":"50.0","dy":"50.0"}}');

      expect(offset, const Offset(50, 50));
    });

    test('offsetToJson', () {
      var string = offsetToJson(const Offset(50, 50));

      expect(string, '{"offset":{"dx":"50.0","dy":"50.0"}}');

      var string2 = offsetToJson(null);

      expect(string2, null);
    });

    test('offsetFromJson', () {
      var offset = offsetFromJson('{"offset":{"dx":"50.0","dy":"50.0"}}');

      expect(offset, const Offset(50, 50));

      var offset2 = offsetFromJson(null);

      expect(offset2, null);

      var offset3 = offsetFromJson('');

      expect(offset3, null);
    });

    test('offsetListToJson', () {
      var string = offsetListToJson([const Offset(50, 50)]);

      expect(string,
          '["{\\"offset\\":{\\"dx\\":\\"50.0\\",\\"dy\\":\\"50.0\\"}}"]');

      var string2 = offsetListToJson([]);

      expect(string2, '[]');

      var string3 = offsetListToJson(null);

      expect(string3, '');
    });

    test('offsetListFromJson', () {
      var offset = offsetListFromJson(
          '["{\\"offset\\":{\\"dx\\":\\"50.0\\",\\"dy\\":\\"50.0\\"}}"]');

      expect(offset, [const Offset(50, 50)]);
    });
  });

  group('path tests', () {
    var pathStringTest =
        '["{\\"offset\\":{\\"dx\\":\\"49.0\\",\\"dy\\":\\"47.5\\"}}","{\\"offset\\":{\\"dx\\":\\"50.0\\",\\"dy\\":\\"47.5\\"}}","{\\"offset\\":{\\"dx\\":\\"51.0\\",\\"dy\\":\\"47.5\\"}}","{\\"offset\\":{\\"dx\\":\\"51.0\\",\\"dy\\":\\"48.5\\"}}","{\\"offset\\":{\\"dx\\":\\"51.0\\",\\"dy\\":\\"49.5\\"}}","{\\"offset\\":{\\"dx\\":\\"51.0\\",\\"dy\\":\\"50.5\\"}}","{\\"offset\\":{\\"dx\\":\\"51.0\\",\\"dy\\":\\"51.5\\"}}","{\\"offset\\":{\\"dx\\":\\"51.0\\",\\"dy\\":\\"52.5\\"}}","{\\"offset\\":{\\"dx\\":\\"50.0\\",\\"dy\\":\\"52.5\\"}}","{\\"offset\\":{\\"dx\\":\\"49.0\\",\\"dy\\":\\"52.5\\"}}","{\\"offset\\":{\\"dx\\":\\"49.0\\",\\"dy\\":\\"51.5\\"}}","{\\"offset\\":{\\"dx\\":\\"49.0\\",\\"dy\\":\\"50.5\\"}}","{\\"offset\\":{\\"dx\\":\\"49.0\\",\\"dy\\":\\"49.5\\"}}","{\\"offset\\":{\\"dx\\":\\"49.0\\",\\"dy\\":\\"48.5\\"}}"]';
    var pathTest = Path()
      ..addRect(
          Rect.fromCenter(center: const Offset(50, 50), width: 2, height: 5));

    test('pathToJson', () {
      var string = pathToJson(Path());

      expect(string, '[]');

      var string2 = pathToJson(pathTest);

      expect(string2, pathStringTest);
    });
  });

  group('key tests', () {
    test('keyToJson', () {
      var string = keyToJson(const Key('test'));

      expect(string, '[<\'test\'>]');
    });

    test('keyFromJson', () {
      var key = keyFromJson('[<\'test\'>]');

      expect(key, const Key('[<\'test\'>]'));
    });

    test('keyRequiredToJson', () {
      var string = keyRequiredToJson(const Key('test'));

      expect(string, '[<\'test\'>]');
    });

    test('keyRequiredFromJson', () {
      var key = keyRequiredFromJson('[<\'test\'>]');

      expect(key, const Key('[<\'test\'>]'));
    });
  });

  group('alignment tests', () {
    test('alignmentToJson', () {
      var string = alignmentToJson(Alignment.center);

      expect(string, 'Alignment.center');
    });

    test('alignmentFromJson', () {
      var alignment = alignmentFromJson('Alignment.bottomRight');

      expect(alignment, Alignment.bottomRight);
    });
  });

  group('flowElementTypes tests', () {
    test('flowElementTypesToJson', () {
      var string = flowElementTypesToJson(FlowElementTypes.circle);

      expect(string, 'circle_flow_element');
    });

    test('flowElementTypesFromJson', () {
      var type = flowElementTypesFromJson('circle_flow_element');

      expect(type, FlowElementTypes.circle);
    });
  });
}
