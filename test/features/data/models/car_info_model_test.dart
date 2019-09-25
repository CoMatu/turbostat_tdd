import 'package:flutter_test/flutter_test.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/car_info.dart';

import '../../../fixtures/mocks/car_info_list_mock.dart';

void main() {
  final tCarInfoModel = mockCarInfoList[0];

  test('should be a subclass of CarInfo entity', () async {
    expect(tCarInfoModel, isA<CarInfo>());
  });
}