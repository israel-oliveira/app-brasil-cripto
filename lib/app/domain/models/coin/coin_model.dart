class CoinModel {
  final String id;
  final String name;
  final String symbol;
  bool isFavorite;

  CoinModel({
    required this.id,
    required this.name,
    required this.symbol,
    this.isFavorite = false,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
    );
  }

   factory CoinModel.fromLocalJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json['coin_id'],
      name: json['name'],
      symbol: json['symbol'],
      isFavorite: json['is_favorite'] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coin_id': id,
      'name': name,
      'symbol': symbol,
      'is_favorite': isFavorite ? 1 : 0,
    };
  }

  Map<String, dynamic> toFavoritesJson() {
    return {
      'is_favorite': isFavorite ? 1 : 0,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CoinModel &&
        other.id == id &&
        other.name == name &&
        other.symbol == symbol &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        symbol.hashCode ^
        isFavorite.hashCode;
  }

  @override
  String toString() {
    return 'CoinModel{id: $id, name: $name, symbol: $symbol, isFavorite: $isFavorite}';
  }
}
