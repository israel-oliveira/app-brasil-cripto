import 'package:app_cripto/app/core/enum/app_state_enum.dart';
import 'package:app_cripto/app/core/exceptions/auth_exception.dart';
import 'package:app_cripto/app/domain/repositories/user/user_repository.dart';
import 'package:mobx/mobx.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = RegisterViewModelBase with _$RegisterViewModel;

abstract class RegisterViewModelBase with Store {
  final UserRepository _userRepository;

  RegisterViewModelBase({required UserRepository userRepository})
    : _userRepository = userRepository;

  @observable
  String? _error;

  @computed
  String? get error => _error;

  @observable
  AppState _state = AppState.initial;

  @computed
  AppState get state => _state;

  void registerUser(String email, String password) async {
    _error = null;
    _state = AppState.loading;

    final result = await _userRepository.register(email, password);
    result.fold(
      (user) {
        _state = AppState.success;
      },
      (error) {
        if (error is AuthException) {
          _error = error.message;
        } else {
          _error = 'Erro ao registrar usuário';
        }
        _state = AppState.error;
      },
    );
  }
}
