import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/car_usecases/add_car_model.dart';

class MockAddCarModel extends Mock implements AddCarModel {}

class MockTurbostatRepository extends Mock implements TurbostatRepository {}

void main() {
  MockTurbostatRepository mockTurbostatRepository;
  AddCarModel usecase;

  setUp(() {
    mockTurbostatRepository = MockTurbostatRepository();
    usecase = AddCarModel(repository: mockTurbostatRepository);
  });

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

  test('should add CarModel to local data source', () async {
    await usecase.addCarModel(tCarModel);
  });
}
