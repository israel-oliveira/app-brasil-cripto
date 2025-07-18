import 'package:app_cripto/app/domain/models/coin/coin_market_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_model.dart';

abstract class CoinService {
  Future<List<CoinModel>> getAll();
  Future<List<CoinModel>> getFavorities();
  Future<void> updateFavorities(CoinModel coins);
  Future<List<CoinMarketModel>> getCoinMarketByPage(int page);
}
