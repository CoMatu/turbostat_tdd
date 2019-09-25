import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/car_info.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/car_info_repository.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_car_info_list.dart';

import '../../../fixtures/mocks/car_info_list_mock.dart';

class MockCarInfoRepository extends Mock implements CarInfoRepository {}

void main() {
  GetCarInfoList usecase;
  MockCarInfoRepository mockCarInfoRepository;

  setUp(() {
    mockCarInfoRepository = MockCarInfoRepository();
    usecase = GetCarInfoList(mockCarInfoRepository);
  });

  final tUserId = '22ll55';
  final List<CarInfo> tCarInfoList = mockCarInfoList; // ? what info

  test(
    'should get set of cars with info from the repository',
    () async {
      when(mockCarInfoRepository.getCarsInfoList(any))
      .thenAnswer((_) async => Right(tCarInfoList));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase(Params(userId: tUserId));
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(tCarInfoList));
    }
  );
}
