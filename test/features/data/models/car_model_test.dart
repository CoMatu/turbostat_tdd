import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/car.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tCarModel = CarModel(
  carId: '1',
  carName: 'car 1',
  carMark: 'nissan',
  carModel: 'note',
  carYear: 2012,
  carMileage: 83300,
  carVin: 'VIN123'
);

  test('should be a subclass of Car entity', () async {
    expect(tCarModel, isA<Car>());
  });

  group('fromJson', () {
    test('should be return a valid model', () async {
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture('car.json'));

      final result = CarModel.fromJson(jsonMap);

      expect(result, tCarModel);
    });
  });
}