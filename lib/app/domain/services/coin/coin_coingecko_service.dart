import 'dart:developer';

import 'package:app_cripto/app/core/client/dio_client.dart';
import 'package:app_cripto/app/core/database/sql_connection_factory.dart';
import 'package:app_cripto/app/domain/models/coin/coin_detail_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_market_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_model.dart';
import 'package:app_cripto/app/domain/services/coin/coin_service.dart';
import 'package:sqflite/sqflite.dart';

class CoinCoingeckoService implements CoinService {
  final DioClient _client;
  final SqlConnectionFactory _sqlConnectionFactory;

  CoinCoingeckoService({
    required DioClient client,
    required SqlConnectionFactory sqlConnectionFactory,
  }) : _client = client,
       _sqlConnectionFactory = sqlConnectionFactory;

  @override
  Future<List<CoinModel>> getAll([bool newLocal = false]) async {
    List<CoinModel> coins = await _getLocalCoins();

    if (coins.isNotEmpty && !newLocal) {
      log('Dados veio local');
      return coins;
    }

    final response = await _client.get('/coins/list');
    final value = (response.data as List)
        .map((coin) => CoinModel.fromJson(coin))
        .toList();
    await _saveLocalCoins(value);
    log('Dados veio da API');
    return value;
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

  Future<void> _saveLocalCoins(List<CoinModel> coins) async {
    final conn = await _sqlConnectionFactory.openConnection();

    await conn.transaction((txn) async {
      for (final coin in coins) {
        await txn.insert(
          'coins',
          coin.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  Future<List<CoinModel>> _getLocalCoins() async {
    final conn = await _sqlConnectionFactory.openConnection();
    final List<Map<String, dynamic>> maps = await conn.query('coins');
    return List.generate(maps.length, (i) {
      return CoinModel.fromLocalJson(maps[i]);
    });
  }

  @override
  Future<List<CoinModel>> getFavorities() async {
    final conn = await _sqlConnectionFactory.openConnection();
    final List<Map<String, dynamic>> maps = await conn.query(
      'coins',
      where: 'is_favorite = ?',
      whereArgs: [1],
    );
    return List.generate(maps.length, (i) {
      return CoinModel.fromLocalJson(maps[i]);
    });
  }

  @override
  Future<void> updateFavorities(CoinModel coin) async {
    final conn = await _sqlConnectionFactory.openConnection();
    await conn.insert(
      'coins',
      coin.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<CoinMarketModel>> getFavoritiesCoinMarket(
    List<CoinModel> coins,
  ) async {
    if (coins.isEmpty) {
      return [];
    }

    final ids = coins.map((coin) => coin.id).join(',');
    final response = await _client.get(
      '/coins/markets',
      queryParameters: {
        'vs_currency': 'brl',
        'ids': ids,
      },
    );
    return (response.data as List)
        .map((coin) => CoinMarketModel.fromFavoritiesJson(coin))
        .toList();
  }

  @override
  Future<CoinDetailModel> getCoinDetailById(String id) async {
    final response = await _client.get(
      '/coins/$id',
    );

    return CoinDetailModel.fromJson(response.data);
  }
}
