class CryptocurrencyResponseModel {
  final int id;
  final int createdAt;
  final String name;
  final double price;
  final String symbol;
  final String iconAddress;
  final bool isFavorite;

  CryptocurrencyResponseModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.price,
    required this.symbol,
    required this.iconAddress,
    required this.isFavorite,
  });

  factory CryptocurrencyResponseModel.fromJson(Map<String, dynamic> json) {
    return CryptocurrencyResponseModel(
      id: json['id'],
      createdAt: json['created_at'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      symbol: json['symbol'],
      iconAddress: json['icon_address'],
      isFavorite: json['is_favorite'],
    );
  }
}
