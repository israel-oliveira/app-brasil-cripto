import 'package:app_cripto/app/domain/models/coin/coin_market_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_model.dart';
import 'package:app_cripto/app/domain/repositories/coin/coin_repository.dart';
import 'package:app_cripto/app/domain/services/coin/coin_service.dart';
import 'package:result_dart/result_dart.dart';

class CoinCoingeckoRepository implements CoinRepository {
  final CoinService _coinService;
  CoinCoingeckoRepository({required CoinService coinService})
    : _coinService = coinService;
  @override
  AsyncResult<List<CoinModel>> getAllCoins() async {
    final result = await _coinService.getAll();
    if (result.isEmpty) {
      return Failure(Exception('No coins found'));
    }
    return Success(result);
  }

  @override
  AsyncResult<List<CoinMarketModel>> getCoinMarketByPage(int page) async {
    try {
      final result = await _coinService.getCoinMarketByPage(page);
      return Success(result);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  @override
  AsyncResult<List<CoinModel>> getFavorites() async {
    try {
      final result = await _coinService.getFavorities();
      return Success(result);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  @override
  AsyncResult<bool> saveFavorites(CoinModel coin) async {
    try {
      await _coinService.updateFavorities(coin);
      return Success(true);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  @override
  AsyncResult<List<CoinMarketModel>> getFavoritiesCoinMarket(
    List<CoinModel> coins,
  ) async {
    final result = await _coinService.getFavoritiesCoinMarket(coins);

    return Success(result);
  }
}
