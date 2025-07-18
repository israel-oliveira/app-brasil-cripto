import 'package:app_cripto/app/core/client/header_interceptor.dart';
import 'package:app_cripto/app/core/exceptions/client_exception.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient({required Dio dio}) : _dio = dio {
    _dio.options.baseUrl = "https://api.coingecko.com/api/v3";
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.options.headers = {
      'Content-Type': 'application/json',
    };

    _dio.interceptors.add(
      HeaderInterceptor(
        headers: {
          'x-cg-api-key': 'CG-fB6oJorRHNjGhY3xmzEaqdpV',
        },
      ),
    );
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
      ),
    );
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        throw GetClientException('Limite de requisições atingido');
      }
      throw GetClientException(e.message ?? 'Erro ao obter dados');
    } catch (e) {
      throw GetClientException(e.toString());
    }
  }
}
