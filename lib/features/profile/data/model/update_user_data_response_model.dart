class UpdateUserDataResponseModel {
  final int id;
  final int createdAt;
  final String name;
  final String email;
  final String? phoneNumber;

  UpdateUserDataResponseModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  factory UpdateUserDataResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserDataResponseModel(
      id: json['id'],
      createdAt: json['created_at'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
    );
  }
}
