import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:turbostat_tdd/core/error/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, FirebaseUser>> signInWithGoogle();
  Future<void> signInWithCredentials(String email, String password);
  Future<void> signUp({String email, String password});
  Future<void> signOut();
  Future<Either<Failure, bool>> isSignedIn();
  Future<Either<Failure, String>> getUser();
}