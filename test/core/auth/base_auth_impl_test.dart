import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turbostat_tdd/core/auth/base_auth.dart';

class MockBaseAuth extends Mock implements BaseAuth {}

void main() {
  MockBaseAuth mockBaseAuth;
  BaseAuthImpl baseAuth;

  group('BaseAuth', () {
    final String tUserId = 'qwerty22';
    setUp(() {
      mockBaseAuth = MockBaseAuth();
      baseAuth = BaseAuthImpl();
    });

    test('should return current user if he is logged', () async {});
    when(mockBaseAuth.currentUser()).thenAnswer((_) async => tUserId);
  });

}
