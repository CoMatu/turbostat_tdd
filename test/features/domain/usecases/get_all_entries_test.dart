import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_entries.dart';

class MockTurbostatRepository extends Mock implements TurbostatRepository {}

void main() {
  GetAllEntries usecase;
  MockTurbostatRepository mockTurbostatRepository;

  setUp(() {
    mockTurbostatRepository = MockTurbostatRepository();
    usecase = GetAllEntries(repository: mockTurbostatRepository);
  });

  final List<EntryModel> tAllEntryModels = [
    EntryModel(
      entryId: '1',
      maintenanceId: '1',
      entryName: 'name1',
      entryDateTime: DateTime(2019, 07, 22, 00, 00),
      entryMileage: 80000,
      entryWorkPrice: 200.00,
      entryNote: 'entry note',
    ),
    EntryModel(
      entryId: '2',
      maintenanceId: '2',
      entryName: 'name2',
      entryDateTime: DateTime(2019, 11, 15, 00, 00),
      entryMileage: 55000,
      entryWorkPrice: 500.00,
      entryNote: 'entry note',
    ),
  ];

  final String tCarId = 'v1';

  test('should return all entry models from the repository', () async {
    when(mockTurbostatRepository.getAllEntries(tCarId))
        .thenAnswer((_) async => Right(tAllEntryModels));

    final result = await usecase.call(Params(carId: tCarId));

    expect(result, Right(tAllEntryModels));
    verify(mockTurbostatRepository.getAllEntries(tCarId));
    verifyNoMoreInteractions(mockTurbostatRepository);
  });
}
