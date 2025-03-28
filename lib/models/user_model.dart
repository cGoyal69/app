class UserModel {
  final String name;
  final String email;
  final String phone;
  final int? id;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    this.id,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        id: json['id'],
      );
}
