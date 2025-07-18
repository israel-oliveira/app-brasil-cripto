class CoinModel {
  final String id;
  final String name;
  final String symbol;
  final bool isFavorite;

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
