class CryptocurrencyResponseEntity {
  final int id;
  final int createdAt;
  final String name;
  final double price;
  final String symbol;
  final String iconAddress;
  final bool isFavorite;

  CryptocurrencyResponseEntity({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.price,
    required this.symbol,
    required this.iconAddress,
    required this.isFavorite,
  });
}
