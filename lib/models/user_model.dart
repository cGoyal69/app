class UserModel {
  final String name;
  final String email;
  final String phone;

  UserModel({required this.name, required this.email, required this.phone});

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone': phone,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(name: json['name'], email: json['email'], phone: json['phone']);
}
