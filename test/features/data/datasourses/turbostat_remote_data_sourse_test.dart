import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:firebase_core/firebase_core.dart' as fb;
import 'package:flutter_test/flutter_test.dart';

void main() {
  fb.FirebaseApp app;
  fs.Firestore firestore;

  setUp(() async {
    app = await fb.FirebaseApp.configure(
      name: 'test',
      options: const fb.FirebaseOptions(
        googleAppID: 'com.example.turbostat_tdd',
        projectID: 'carstat-d0da1'
      )
    );
  });
}