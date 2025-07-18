
import 'package:app_cripto/app/domain/models/coin/coin_market_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_model.dart';
import 'package:app_cripto/app/domain/services/coin/coin_service.dart';

class CoinServiceCoingecko implements CoinService {
  @override
  Future<List<CoinModel>> getAll() {
    // Implementation for fetching all coins from CoinGecko
    throw UnimplementedError();
  }

  @override
  Future<List<CoinMarketModel>> getCoinMarketByPage(int page) {
    // Implementation for fetching coin market data by page from CoinGecko
    throw UnimplementedError();
  }
  
}