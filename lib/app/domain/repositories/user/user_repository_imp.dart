import 'package:app_cripto/app/core/exceptions/auth_exception.dart';
import 'package:app_cripto/app/domain/repositories/user/user_repository.dart';
import 'package:app_cripto/app/domain/services/user/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_dart/result_dart.dart';

class UserRepositoryImp extends UserRepository {
  final UserService _userService;
  UserRepositoryImp({required UserService userService})
    : _userService = userService;

  @override
  AsyncResult<User> register(String email, String password) async {
    try {
      final user = await _userService.register(email, password);
      if (user != null) {
        return Success(user);
      } else {
        return Failure(NullUserAuthException());
      }
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  @override
  AsyncResult<User> login(String email, String password) async {
    try {
      final user = await _userService.login(email, password);
      if (user != null) {
        return Success(user);
      } else {
        return Failure(NullUserAuthException());
      }
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  @override
  AsyncResult<String> resetPassword(String email) async {
    try {
      await _userService.resetPassword(email);
      return Success(
        'Se este e-mail estiver cadastrado, '
        'você receberá as instruções para resetar a senha.',
      );
    } on Exception catch (e) {
      return Failure(e);
    }
  }
  
  @override
  AsyncResult<String> logout() async {
    try {
      await _userService.logout();
      return Success('Deslogado com sucesso.');
    } on Exception catch (e) {
      return Failure(e);
    }
  }
  
}
