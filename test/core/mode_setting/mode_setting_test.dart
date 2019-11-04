import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbostat_tdd/core/mode/mode_info.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockModeSettingImpl extends Mock implements ModeInfoImpl {}

void main() {
  ModeInfoImpl mode;

  setUp(() async {
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return <String, dynamic>{
          "flutter.data_source": "device", // without flutter. test don't work
        }; // set initial values here if desired
      }
      return null;
    });
    await SharedPreferences.getInstance();
    mode = ModeInfoImpl();
  });

  test('should return false if mode is device', () async {
    final tCloudMode = await Future.value(false);

    final res = await mode.isCloudMode;

    expect(res, tCloudMode);
  });
}
