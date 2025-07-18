import 'package:app_cripto/app/core/client/dio_client.dart';
import 'package:app_cripto/app/domain/models/coin/coin_market_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_model.dart';
import 'package:app_cripto/app/domain/services/coin/coin_service.dart';

class CoinCoingeckoService implements CoinService {
  final DioClient _client;

  CoinCoingeckoService({required DioClient client}) : _client = client;

  @override
  Future<List<CoinModel>> getAll() async {
    final response = await _client.get('/coins/list');
    return (response.data as List)
        .map((coin) => CoinModel.fromJson(coin))
        .toList();
  }

  @override
  Future<List<CoinMarketModel>> getCoinMarketByPage(int page) async {
    final response = await _client.get(
      '/coins/markets',
      queryParameters: {
        'vs_currency': 'brl',
        'order': 'market_cap_desc',
        'per_page': 15,
        'page': page,
      },
    );
    return (response.data as List)
        .map((coin) => CoinMarketModel.fromJson(coin))
        .toList();
  }
}
