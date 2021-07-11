import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationService {
  final FirebaseAuth firebaseAuth;

  AuthenticationService({@required this.firebaseAuth});

  Future signUp({@required String email, @required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      if (e.runtimeType == FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          throw AuthException('This email Alreay Exists');
        } else if (e.code == 'invalid-email') {
          throw AuthException('Entered email is invalid');
        } else if (e.code == 'weak-password') {
          throw AuthException('Password must be at least 6 characters');
        }
      } else {
        throw AuthException('Check your connection and try again');
      }
    }
  }

  Future signIn({@required String email, @required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      if (e.code == 'email-already-in-use') {
        throw AuthException('This email Alreay Exists');
      } else if (e.code == 'invalid-email') {
        throw AuthException('Entered email is invalid');
      } else if (e.code == 'user-not-found') {
        throw AuthException('Invalid email and password combination');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Invalid email and password combination');
      } else {
        throw AuthException('Check your connection and try again');
      }
    }
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
}
