import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/entry.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tEntryModel = EntryModel(
      entryId: '1',
      maintenanceId: '1',
      entryDateTime: DateTime(2019, 7, 22),
      entryMileage: 80000,
      entryWorkPrice: 200.00,
      entryNote: "entry note");

  test('should be a subclass of Entry entity', () async {
    expect(tEntryModel, isA<Entry>());
  });

  group('fromJson', () {
    test('should be return a valid model', () async {
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('entry.json'));

      final result = EntryModel.fromJson(jsonMap);

      expect(result, tEntryModel);
    });
  });
}
