class ClientException implements Exception {
  final String message;

  ClientException(this.message);

  @override
  String toString() => 'ClientException: $message';
}

class GetClientException extends ClientException {
  GetClientException(String message) : super("Erro (GET): $message");
}

class PostClientException extends ClientException {
  PostClientException(String message) : super("Erro (POST): $message");
}
