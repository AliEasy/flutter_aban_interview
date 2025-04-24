abstract interface class TokenSecureStorage {
  Future<void> saveToken(String token);
}