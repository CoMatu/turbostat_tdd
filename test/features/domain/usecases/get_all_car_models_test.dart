import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_car_models.dart';

class MockTurbostatRepository extends Mock implements TurbostatRepository {}

void main() {
  GetAllCarModels usecase;
  MockTurbostatRepository mockTurbostatRepository;

  setUp(() {
    mockTurbostatRepository = MockTurbostatRepository();
    usecase = GetAllCarModels(repository: mockTurbostatRepository);
  });

  final String tUserId = 'matu1';
  final List<CarModel> tAllCarModels = [
    CarModel(
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
    ),
    CarModel(
      carId: '2',
      carName: 'car 2',
      carMark: 'nissan',
      carModel: 'murano',
      carYear: 2017,
      carVin: 'VIN321',
      licencePlate: 'f333',
      fuelType: 'liquid',
      tankVolume: 38,
      carNote: 'car note',
    ),
  ];

  test('should get cars for userId from the repository', () async {
    when(mockTurbostatRepository.getAllCarModels())
        .thenAnswer((_) async => Right(tAllCarModels));

    final result = await usecase(NoParams());

    expect(result, Right(tAllCarModels));
    verify(mockTurbostatRepository.getAllCarModels());
    verifyNoMoreInteractions(mockTurbostatRepository);
  });
}
