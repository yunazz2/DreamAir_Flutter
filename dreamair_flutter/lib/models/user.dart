class User {
  late int userNo;
  late String userId;
  late String userPw;
  late String userPwCheck;
  late String name;
  late String phone;
  late String email;
  late String address;
  late double mileage;

  User({
    required this.userNo,
    required this.userId,
    required this.userPw,
    required this.userPwCheck,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.mileage,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userNo: json['userNo'] ?? 0,
      userId: json['userId'] ?? '',
      userPw: json['userPw'] ?? '',
      userPwCheck: json['userPwCheck'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      mileage: json['mileage'] ?? 0.0,
    );
  }
}
