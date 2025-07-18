import 'package:dio/dio.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  final Map<String, dynamic> headers;
  HeaderInterceptor({required this.headers});
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(headers);
    super.onRequest(options, handler);
  }
}
