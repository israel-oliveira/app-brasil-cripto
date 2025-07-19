import 'package:app_cripto/app/domain/models/coin/coin_model.dart';

class CoinDetailModel extends CoinModel {
  final Map<String, String> image;
  final int? marketCapRank;
  final MarketData marketData;
  final Map<String, String> description;
  final Links links;
  final String? genesisDate;

  CoinDetailModel({
    required super.id,
    required super.name,
    required super.symbol,
    required this.image,
    this.marketCapRank,
    required this.marketData,
    required this.description,
    required this.links,
    this.genesisDate,
  });

  factory CoinDetailModel.fromJson(Map<String, dynamic> json) {
    return CoinDetailModel(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      image: Map<String, String>.from(json['image']),
      marketCapRank: json['market_cap_rank'],
      marketData: MarketData.fromJson(json['market_data']),
      description: Map<String, String>.from(json['description']),
      links: Links.fromJson(json['links']),
      genesisDate: json['genesis_date'],
      
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'image': image,
      'market_cap_rank': marketCapRank,
      'market_data': marketData.toJson(),
      'description': description,
      'links': links.toJson(),
      'genesis_date': genesisDate,
    };
  }
}

class MarketData {
  final Map<String, num> currentPrice;
  final double? priceChangePercentage24h;
  final Map<String, int> marketCap;
  final Map<String, int> totalVolume;
  final double? circulatingSupply;
  final double? totalSupply;

  MarketData({
    required this.currentPrice,
    this.priceChangePercentage24h,
    required this.marketCap,
    required this.totalVolume,
    this.circulatingSupply,
    this.totalSupply,
  });

  factory MarketData.fromJson(Map<String, dynamic> json) {
    return MarketData(
      currentPrice: Map<String, num>.from(json['current_price']),
      priceChangePercentage24h: json['price_change_percentage_24h']?.toDouble(),
      marketCap: Map<String, int>.from(json['market_cap']),
      totalVolume: Map<String, int>.from(json['total_volume']),
      circulatingSupply: json['circulating_supply']?.toDouble(),
      totalSupply: json['total_supply']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_price': currentPrice,
      'price_change_percentage_24h': priceChangePercentage24h,
      'market_cap': marketCap,
      'total_volume': totalVolume,
      'circulating_supply': circulatingSupply,
      'total_supply': totalSupply,
    };
  }
}

class Links {
  final List<String> homepage;
  final List<String> blockchainSite;

  Links({
    required this.homepage,
    required this.blockchainSite,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      homepage: List<String>.from(json['homepage']),
      blockchainSite: List<String>.from(json['blockchain_site']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'homepage': homepage,
      'blockchain_site': blockchainSite,
    };
  }
}

