import 'package:app_cripto/app/core/enum/app_state_enum.dart';
import 'package:mobx/mobx.dart';
part 'app_base_view_model.g.dart';

class AppBaseViewModel = AppBaseViewModelBase with _$AppBaseViewModel;

abstract class AppBaseViewModelBase with Store {
  @observable
  String? _error;

  @computed
  String? get error => _error;

  @computed
  bool get hasError => _error != null;

  @action
  void setError(String? error) {
    _error = error;
    if (error != null) {
      setState(AppState.error);
    }
  }

  @observable
  String? _infoMessage;

  @computed
  String? get infoMessage => _infoMessage;

  @action
  void setInfoMessage(String? message) {
    _infoMessage = message;
  }

  @action
  void successInfo(String message) {
    setInfoMessage(message);
    setState(AppState.initial);
  }

  @observable
  AppState _state = AppState.initial;

  @computed
  AppState get state => _state;

  @action
  void setState(AppState state) {
    _state = state;
  }

  @action
  void initLoading() => setState(AppState.loading);

  @action
  void success() => setState(AppState.success);
  
  @action
  void showLoadAndResetState() {
    setState(AppState.loading);
    setError(null);
    setInfoMessage(null);
  }
}
