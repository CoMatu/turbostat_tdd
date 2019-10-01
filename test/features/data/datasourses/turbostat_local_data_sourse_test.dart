import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/local_data_source.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  TurbostatLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = TurbostatLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });}
