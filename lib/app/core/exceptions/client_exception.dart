class ClientException implements Exception {
  final String message;

  ClientException(this.message);

  @override
  String toString() => 'ClientException: $message';
}

class GetClientException extends ClientException {
  GetClientException(super.message);
}

class PostClientException extends ClientException {
  PostClientException(super.message);
}
