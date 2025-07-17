enum AppState { initial, loading, success, error }

extension AppStateExtension on AppState {
  bool get isInitial => this == AppState.initial;
  bool get isLoading => this == AppState.loading;
  bool get isSuccess => this == AppState.success;
  bool get isError => this == AppState.error;
}
