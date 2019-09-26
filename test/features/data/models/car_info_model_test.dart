import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_info_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/car_info.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../fixtures/mocks/car_info_list_mock.dart';

void main() {
  final tCarInfoModel = mockCarInfoList[0];

  test('should be a subclass of CarInfo entity', () async {
    expect(tCarInfoModel, isA<CarInfo>());
  });

  group('fromJson', () {
    test('should be return a valid model', () {
      final Map<String, dynamic> jsonMap = 
      json.decode(fixture('car_info.json'));

      final result = CarInfoModel.fromJson(jsonMap);

      expect(result, tCarInfoModel);
    });
  });
}