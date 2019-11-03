import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_car_models.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_concrete_car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';

class MockGetConcreteCar extends Mock implements GetConcreteCarModel {}

class MockGetAllCar extends Mock implements GetAllCarModels {}

void main() {
  LoadDataBloc bloc;
  MockGetConcreteCar mockGetConcreteCar;
  MockGetAllCar mockGetAllCar;

  setUp(() {
    mockGetAllCar = MockGetAllCar();
    mockGetConcreteCar = MockGetConcreteCar();

    bloc = LoadDataBloc(
      concrete: mockGetConcreteCar,
      allCarModels: mockGetAllCar,
    );
  });

  test('initialState should be Empty', () {
    // assert
    expect(bloc.initialState, equals(InitialLoadDataState()));
  });

  test('should get data from the concrete use case', () async {});
}
