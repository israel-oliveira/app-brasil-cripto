import 'package:app_cripto/app/domain/models/coin/coin_detail_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_market_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_model.dart';

abstract class CoinService {
  Future<List<CoinModel>> getAll([bool newLocal = false]);
  Future<List<CoinModel>> getFavorities();
  Future<void> updateFavorities(CoinModel coin);
  Future<List<CoinMarketModel>> getCoinMarketByPage(int page);
  Future<List<CoinMarketModel>> getFavoritiesCoinMarket(List<CoinModel> coins);
  Future<CoinDetailModel> getCoinDetailById(String id);
}
