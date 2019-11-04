import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_car_models.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_concrete_car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';

class MockGetConcreteCar extends Mock implements GetConcreteCarModel {}

class MockGetAllCar extends Mock implements GetAllCarModels {}

void main() {
  LoadDataBloc bloc;
  MockGetConcreteCar mockGetConcreteCar;
  MockGetAllCar mockGetAllCar;

  setUpAll(() {
    mockGetAllCar = MockGetAllCar();
    mockGetConcreteCar = MockGetConcreteCar();

    bloc = LoadDataBloc(
      concrete: mockGetConcreteCar,
      allCarModels: mockGetAllCar,
    );
  });

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

  test('initialState should be Empty', () {
    // assert
    expect(bloc.initialState, equals(InitialLoadDataState()));
  });

  group('getAllCarsModels bloc', () {
  test('should get data from the allcarmodels use case', () async {
    when(mockGetAllCar(any)).thenAnswer((_) async => Right(tAllCarModels));
    bloc.add(GetAllCar());
    await untilCalled(mockGetAllCar(any));
    verify(mockGetAllCar(NoParams()));
  });
  });

}
