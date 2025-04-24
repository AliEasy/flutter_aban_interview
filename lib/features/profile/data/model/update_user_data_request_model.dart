class UpdateUserDataRequestModel {
  final String phoneNumber;

  UpdateUserDataRequestModel({required this.phoneNumber});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone_number'] = phoneNumber;
    return map;
  }
}
