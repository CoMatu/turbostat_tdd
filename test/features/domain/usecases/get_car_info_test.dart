import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_info.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/car_info_repository.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_car_info_set.dart';

class MockCarInfoRepository extends Mock implements CarInfoRepository {}

void main() {
  GetCarInfoSet usecase;
  MockCarInfoRepository mockCarInfoRepository;

  setUp(() {
    mockCarInfoRepository = MockCarInfoRepository();
    usecase = GetCarInfoSet(mockCarInfoRepository);
  });

  final tUserId = '22ll55';
  final Set<CarInfo> tCarInfoSet = null; // ? what info

  test(
    'should get set of cars with info from the repository',
    () async {
      when(mockCarInfoRepository.getCarsInfoSet(any))
      .thenAnswer((_) async => Right(tCarInfoSet));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase.execute(userId: tUserId);
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(tCarInfoSet));
    }
  );
}
