// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterViewModel on RegisterViewModelBase, Store {
  Computed<String?>? _$errorComputed;

  @override
  String? get error => (_$errorComputed ??= Computed<String?>(
    () => super.error,
    name: 'RegisterViewModelBase.error',
  )).value;
  Computed<AppState>? _$stateComputed;

  @override
  AppState get state => (_$stateComputed ??= Computed<AppState>(
    () => super.state,
    name: 'RegisterViewModelBase.state',
  )).value;

  late final _$_errorAtom = Atom(
    name: 'RegisterViewModelBase._error',
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
    name: 'RegisterViewModelBase._state',
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

  @override
  String toString() {
    return '''
error: ${error},
state: ${state}
    ''';
  }
}
