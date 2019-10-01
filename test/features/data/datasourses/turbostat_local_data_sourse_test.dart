import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/hive_data_base.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/hive_data_base_info.dart';

class MockTurbostatHive extends Mock implements HiveDataBase{}
class MockHiveDataBaseInfo extends Mock implements HiveDataBaseInfo {}

main() async {
  MockTurbostatHive mockTurbostatHive;
  MockHiveDataBaseInfo mockHiveDataBaseInfo;
  final Directory appDocumentDir =
      await path_provider.getApplicationDocumentsDirectory();

  setUp(() {
    mockTurbostatHive = MockTurbostatHive();
    mockHiveDataBaseInfo = MockHiveDataBaseInfo();
  });

  test('hive database should be initialized', () async {
    when(mockHiveDataBaseInfo.isInit).thenAnswer((_) async => true);
    
  });
}
