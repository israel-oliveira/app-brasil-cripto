
import 'package:app_cripto/app/domain/models/coin/coin_market_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_model.dart';
import 'package:app_cripto/app/domain/repositories/coin/coin_repository.dart';
import 'package:result_dart/result_dart.dart';

class CoinCoingeckoRepository implements CoinRepository {
  @override
  AsyncResult<List<CoinModel>> getAllCoins() {
    // Implementation for fetching all coins from CoinGecko
    throw UnimplementedError();
  }

  @override
  AsyncResult<List<CoinMarketModel>> getCoinMarketByPage(int page) {
    // Implementation for fetching coin market data by page from CoinGecko
    throw UnimplementedError();
  }
}