import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/mileage_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/mileage_usecases/add_car_mileage.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/mileage_usecases/get_car_mileage.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/load_mileage_bloc/load_mileage_bloc.dart';

class MockGetCarMileage extends Mock implements GetCarMileage {}

class MockAddCarMileage extends Mock implements AddCarMileage {}

void main() {
  LoadMileageBloc bloc;
  MockGetCarMileage mockGetCarMileage;
  MockAddCarMileage mockAddCarMileage;

  setUp(() {
    mockGetCarMileage = MockGetCarMileage();
    mockAddCarMileage = MockAddCarMileage();

    bloc = LoadMileageBloc(
      getMileage: mockGetCarMileage,
      addMileage: mockAddCarMileage,
    );
  });

  test('initialState should be Empty', () {
    // assert
    expect(bloc.initialState, equals(LoadMileageInitial()));
  });

  group('Get car mileage', () {
    final MileageModel tCarMileage = MileageModel(
      mileageDateTime: DateTime(2020, 01, 01),
      mileage: 85540,
    );

    final tCarId = '123car';

    test('should get data from usecase', () async {
      when(mockGetCarMileage(any)).thenAnswer((_) async => Right(tCarMileage));
      bloc.add(GetMileage(carId: tCarId));

      await untilCalled(mockGetCarMileage(any));
      verify(mockGetCarMileage(Params(carId: tCarId)));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully',
        () async {
      when(mockGetCarMileage(any)).thenAnswer((_) async => Right(tCarMileage));
      final expected = [
        LoadMileageInitial(),
        LoadedCarMileage(mileage: tCarMileage),
      ];

      expectLater(bloc, emitsInOrder(expected));
      bloc.add(GetMileage(carId: tCarId));
    });
  });
}
