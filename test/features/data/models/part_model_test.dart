import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/part.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tPartModel = PartModel(
    partId: 'part1',
    partCode: 'F1',
    partName: 'Filter 200AF',
    partPrice: 100.0,
  );

  test('should be a subclass of Part entity', () async {
    expect(tPartModel, isA<Part>());
  });

  group('fromJson', () {
    test('should be return a valid model', () async {
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('part.json'));

      final result = PartModel.fromJson(jsonMap);

      expect(result, tPartModel);
    });
  });
}
