// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_base_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppBaseViewModel on AppBaseViewModelBase, Store {
  Computed<String?>? _$errorComputed;

  @override
  String? get error => (_$errorComputed ??= Computed<String?>(
    () => super.error,
    name: 'AppBaseViewModelBase.error',
  )).value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??= Computed<bool>(
    () => super.hasError,
    name: 'AppBaseViewModelBase.hasError',
  )).value;
  Computed<AppState>? _$stateComputed;

  @override
  AppState get state => (_$stateComputed ??= Computed<AppState>(
    () => super.state,
    name: 'AppBaseViewModelBase.state',
  )).value;

  late final _$_errorAtom = Atom(
    name: 'AppBaseViewModelBase._error',
    context: context,
  );

  @override
  String? get _error {
    _$_errorAtom.reportRead();
    return super._error;
  }

  @override
  set _error(String? value) {
    _$_errorAtom.reportWrite(value, super._error, () {
      super._error = value;
    });
  }

  late final _$_stateAtom = Atom(
    name: 'AppBaseViewModelBase._state',
    context: context,
  );

  @override
  AppState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(AppState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$AppBaseViewModelBaseActionController = ActionController(
    name: 'AppBaseViewModelBase',
    context: context,
  );

  @override
  void setError(String? error) {
    final _$actionInfo = _$AppBaseViewModelBaseActionController.startAction(
      name: 'AppBaseViewModelBase.setError',
    );
    try {
      return super.setError(error);
    } finally {
      _$AppBaseViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState(AppState state) {
    final _$actionInfo = _$AppBaseViewModelBaseActionController.startAction(
      name: 'AppBaseViewModelBase.setState',
    );
    try {
      return super.setState(state);
    } finally {
      _$AppBaseViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initLoading() {
    final _$actionInfo = _$AppBaseViewModelBaseActionController.startAction(
      name: 'AppBaseViewModelBase.initLoading',
    );
    try {
      return super.initLoading();
    } finally {
      _$AppBaseViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void success() {
    final _$actionInfo = _$AppBaseViewModelBaseActionController.startAction(
      name: 'AppBaseViewModelBase.success',
    );
    try {
      return super.success();
    } finally {
      _$AppBaseViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showLoadAndResetState() {
    final _$actionInfo = _$AppBaseViewModelBaseActionController.startAction(
      name: 'AppBaseViewModelBase.showLoadAndResetState',
    );
    try {
      return super.showLoadAndResetState();
    } finally {
      _$AppBaseViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
hasError: ${hasError},
state: ${state}
    ''';
  }
}
