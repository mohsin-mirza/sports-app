class UserModel {
  String? phone;
  String? name;
  String? email;
  UserModel({this.phone, this.name, this.email});

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'name': name,
        'email': email,
      };
}
