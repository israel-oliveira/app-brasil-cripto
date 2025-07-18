import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_dart/result_dart.dart';

abstract class UserRepository {
  AsyncResult<User> register(String email, String password);
  AsyncResult<User> login(String email, String password);
  AsyncResult<User> googleLogin();
  AsyncResult<String> resetPassword(String email);
}