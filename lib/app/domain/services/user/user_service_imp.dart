import 'package:app_cripto/app/core/exceptions/auth_exception.dart';
import 'package:app_cripto/app/domain/services/user/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class UserServiceImp implements UserService {
  final FirebaseAuth _firebaseAuth;

  UserServiceImp({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      return userCredential.user;
    } on FirebaseAuthException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      // email-already-exists
      if (e.code == 'email-already-in-use') {
        throw EmailAlreadyAuthException();
      } else {
        throw AuthException('Registration failed: ${e.message}');
      }
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on PlatformException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      throw AuthException('Login failed: ${e.message}');
    } on FirebaseAuthException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      if (e.code == 'user-not-found') {
        throw UserNotFoundAuthException();
      } else if (e.code == 'invalid-credential') {
        throw InvalidCredentialAuthException();
      } else {
        throw AuthException('Login failed: ${e.message}');
      }
    }
  }
  
  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());

      if(e.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      }

      throw AuthException('Reset password failed: ${e.message}');
    }
  }
}
