class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() => 'AuthException: $message';
}

class EmailAlreadyAuthException extends AuthException {
  EmailAlreadyAuthException() : super('Email já autenticado');
}

class NullUserAuthException extends AuthException {
  NullUserAuthException() : super('Não foi possível autenticar o usuário');
}

class UserNotFoundAuthException extends AuthException {
  UserNotFoundAuthException() : super('Usuário não encontrado');
}

class InvalidCredentialAuthException extends AuthException {
  InvalidCredentialAuthException() : super('Senha ou e-mail inválido');
}
class InvalidEmailAuthException extends AuthException {
  InvalidEmailAuthException() : super('E-mail inválido');
}
