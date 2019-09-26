import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/car.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../fixtures/mocks/car_info_list_mock.dart';

void main() {
  final tCarModel = mockCar_1;

  test('should be a subclass of Car entity', () async {
    expect(tCarModel, isA<Car>());
  });

  group('fromJson', () {
    test('should be return a valid model', () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('car.json'));

      final result = CarModel.fromJson(jsonMap);

      expect(result, tCarModel);
    });
  });
}
