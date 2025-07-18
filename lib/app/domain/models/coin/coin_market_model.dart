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
    super.isFavorite,
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
      totalVolume: json['total_volume'] ?? 0,
      priceChange24h: (json['price_change_24h'] as num).toDouble(),
      priceChangePercentage24h: (json['price_change_percentage_24h'] as num).toDouble(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    
    return other is CoinMarketModel &&
        other.id == id &&
        other.name == name &&
        other.symbol == symbol &&
        other.imageUrl == imageUrl &&
        other.currentPrice == currentPrice &&
        other.marketCap == marketCap &&
        other.rank == rank &&
        other.totalVolume == totalVolume &&
        other.priceChange24h == priceChange24h &&
        other.priceChangePercentage24h == priceChangePercentage24h;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      symbol,
      imageUrl,
      currentPrice,
      marketCap,
      rank,
      totalVolume,
      priceChange24h,
      priceChangePercentage24h,
    );
  }

}