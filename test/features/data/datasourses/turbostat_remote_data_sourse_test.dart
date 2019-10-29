import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:firebase_core/firebase_core.dart' as fb;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/remote_data_source.dart';

class MockFirestore extends Mock implements fs.Firestore {}

void main() {
  fb.FirebaseApp app;
  fs.Firestore firestore;
  final String userId = '12345';

  setUpAll(() async {
    // Required for FirebaseApp.configure
    fb.FirebaseApp.channel.setMockMethodCallHandler(
      (MethodCall methodCall) async {},
    );

    app = await fb.FirebaseApp.configure(
        name: 'testApp',
        options: const fb.FirebaseOptions(
          googleAppID: '1:1234567890:ios:42424242424242',
          projectID: 'carstat-d0da1',
          gcmSenderID: '1234567890',
        ));

    firestore = fs.Firestore(app: app);
  });

  test('app exists', () {
    expect(app, isNotNull);
    expect(firestore, isNotNull);
  });

  group('Collections and documents', () {
    TurbostatRemoteDataSourceImpl remoteDataSource;
    fs.CollectionReference ref;
    setUp(() {
      remoteDataSource = TurbostatRemoteDataSourceImpl(firestore: firestore);
      ref = firestore.collection(userId);
    });

    test('should get all cars from firestore by userID', () async {
      when(firestore.collection(any)).thenAnswer((_) => ref);
      final result = await remoteDataSource.getAllCarModels(userId);

      expect(result, ref);
    });
  });
}
