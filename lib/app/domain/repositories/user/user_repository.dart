import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_dart/result_dart.dart';

abstract class UserRepository {
  AsyncResult<User> register(String email, String password);
}