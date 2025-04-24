class UpdateUserDataResponseEntity {
  final int id;
  final int createdAt;
  final String name;
  final String email;
  final String? phoneNumber;

  UpdateUserDataResponseEntity({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  factory UpdateUserDataResponseEntity.fromJson(Map<String, dynamic> json) {
    return UpdateUserDataResponseEntity(
      id: json['id'],
      createdAt: json['created_at'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
    );
  }
}
