import 'package:app_cripto/app/core/exceptions/auth_exception.dart';
import 'package:app_cripto/app/core/ui/helpers/notifier/app_base_view_model.dart';
import 'package:app_cripto/app/domain/repositories/user/user_repository.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase extends AppBaseViewModel with Store {
  final UserRepository _userRepository;
  LoginViewModelBase({required UserRepository userRepository})
    : _userRepository = userRepository;

  Future<void> login(String email, String password) async{
    showLoadAndResetState();
    final result = await _userRepository.login(email, password);
    result.fold(
      (user) {
        success();
      },
      (error) {
        if (error is AuthException) {
          setError(error.message);
        } else {
          setError('Erro ao realizar login');
        }
      },
    );
  }
}
