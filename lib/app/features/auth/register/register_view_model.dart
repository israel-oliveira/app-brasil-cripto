import 'package:app_cripto/app/core/exceptions/auth_exception.dart';
import 'package:app_cripto/app/core/ui/helpers/notifier/app_base_view_model.dart';
import 'package:app_cripto/app/domain/repositories/user/user_repository.dart';
import 'package:mobx/mobx.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = RegisterViewModelBase with _$RegisterViewModel;

abstract class RegisterViewModelBase extends AppBaseViewModel with Store {
  final UserRepository _userRepository;

  RegisterViewModelBase({required UserRepository userRepository})
    : _userRepository = userRepository;

  void registerUser(String email, String password) async {
    showLoadAndResetState();

    final result = await _userRepository.register(email, password);
    result.fold(
      (user) {
        success();
      },
      (error) {
        if (error is AuthException) {
          setError(error.message);
        } else {
          setError('Erro ao registrar usuário');
        }
      },
    );
  }
}
