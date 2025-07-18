import 'package:app_cripto/app/domain/models/coin/coin_model.dart';

class CoinMarketModel extends CoinModel {
  final String imageUrl;
  final double currentPrice;
  final double marketCap;
  final int rank;
  final int totalVolume;
  final double priceChange24h;
  final double priceChangePercentage24h;

  CoinMarketModel({
    required super.id,
    required super.name,
    required super.symbol,
    required this.imageUrl,
    required this.currentPrice,
    required this.marketCap,
    required this.rank,
    required this.totalVolume,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
  });

  factory CoinMarketModel.fromJson(Map<String, dynamic> json) {
    return CoinMarketModel(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      imageUrl: json['image'],
      currentPrice: (json['current_price'] as num).toDouble(),
      marketCap: (json['market_cap'] as num).toDouble(),
      rank: json['market_cap_rank'],
      totalVolume: json['total_volume'],
      priceChange24h: (json['price_change_24h'] as num).toDouble(),
      priceChangePercentage24h: (json['price_change_percentage_24h'] as num).toDouble(),
    );
  }
}