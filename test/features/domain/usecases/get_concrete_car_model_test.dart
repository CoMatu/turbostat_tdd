import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_concrete_car_model.dart';

class MockTurbostatRepository extends Mock implements TurbostatRepository {}

void main() {
  GetConcreteCarModel usecase;
  MockTurbostatRepository mockTurbostatRepository;

  setUp(() {
    mockTurbostatRepository = MockTurbostatRepository();
    usecase = GetConcreteCarModel(mockTurbostatRepository);
  });

  final String tCarId = 'car1';
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

  test('should get car for carId from the repository', () async {
    when(mockTurbostatRepository.getConcreteCarModel(any))
        .thenAnswer((_) async => Right(tCarModel));

    final result = await usecase(Params(carId: tCarId));

    expect(result, Right(tCarModel));
    verify(mockTurbostatRepository.getConcreteCarModel(tCarId));
    verifyNoMoreInteractions(mockTurbostatRepository);
  });
}
