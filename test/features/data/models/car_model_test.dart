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
    carVin: 'VIN123',
    licencePlate: 'f333',
    fuelType: 'liquid',
    tankVolume: 38,
    carNote: 'car note',
  );

  test('should be a subclass of Car entity', () async {
    expect(tCarModel, isA<Car>());
  });

  group('fromJson', () {
    test('should be return a valid model', () async {
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('car.json'));

      final result = CarModel.fromJson(jsonMap);

      expect(result, tCarModel);
    });
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tCarModel.toJson();
        // assert
        final expectedJsonMap = {
          "carId": "1",
          "carName": "car 1",
          "carMark": "nissan",
          "carModel": "note",
          "carYear": 2012,
          "carVin": "VIN123",
          "fuelType": "liquid",
          "tankVolume": 38,
          "licencePlate": "f333",
          "carNote": "car note"
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
