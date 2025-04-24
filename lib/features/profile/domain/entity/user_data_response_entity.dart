class UserDataResponseEntity {
  final int id;
  final int createdAt;
  final String name;
  final String email;
  final String? phoneNumber;

  UserDataResponseEntity({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}
