abstract interface class FavoriteCryptocurrencyDataSource {
  Future addToFavorites(int cryptocurrencyId);
  Future deleteFromFavorites(int cryptocurrencyId);
}
