import 'package:app_cripto/app/domain/models/coin/coin_market_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_model.dart';
import 'package:result_dart/result_dart.dart';

abstract class CoinRepository {
  AsyncResult<List<CoinModel>> getAllCoins();
  AsyncResult<List<CoinModel>> getFavorites();
  AsyncResult<bool> saveFavorites(CoinModel coin);
  AsyncResult<List<CoinMarketModel>> getCoinMarketByPage(int page);
}