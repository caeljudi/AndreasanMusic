import 'package:andreasan/models/appuser.dart';
import 'package:andreasan/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signin(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseException catch (e) {
      return e.message!;
    }
  }

  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }

  Future<String> singup(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseException catch (e) {
      return e.message!;
    }
  }
}
